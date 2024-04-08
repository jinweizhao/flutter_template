import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // 单例
  factory LocalStorage() => _getInstance();

  static SharedPreferences? _prefs;
  static _getInstance() {
    _init();
  }

  static Future _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static String? getString(String key, {String? defValue = ''}) {
    return _prefs?.getString(key) ?? defValue;
  }

  static Future<bool>? setString(String key, String value) {
    return _prefs?.setString(key, value);
  }
}
