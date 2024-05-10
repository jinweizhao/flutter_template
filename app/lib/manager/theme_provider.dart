import 'package:flutter/material.dart';
import 'package:flutter_template/manager/local_storage.dart';

extension ThemeModelExtension on ThemeMode {
  String get rawValue {
    return ["System", "Light", "Dark"][index];
  }
}

class ThemeProvider extends ChangeNotifier {
  static String saveKey = 'ThemeProviderTheme';

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode getThemeMode() {
    String savedThemeRawValue =
        LocalStorage.getInstance().getString(ThemeProvider.saveKey) ?? "";
    final dark = ThemeMode.dark.rawValue;
    final light = ThemeMode.light.rawValue;
    if (savedThemeRawValue == dark) {
      _themeMode = ThemeMode.dark;
    } else if (savedThemeRawValue == light) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.system;
    }
    return _themeMode;
  }

  void setThemeMode(ThemeMode themeMode) {
    LocalStorage.getInstance()
        .setString(ThemeProvider.saveKey, themeMode.rawValue);
    _themeMode = themeMode;
    notifyListeners();
  }
}
