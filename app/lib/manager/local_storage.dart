import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? _prefs;
  static LocalStorage? _instance;
  LocalStorage._() {
    init();
  }
  void init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

// 单例
  static LocalStorage getInstance() {
    _instance ??= LocalStorage._();
    return _instance!;
  }

  LocalStorage._pre(SharedPreferences pref) {
    _prefs = pref;
  }
  static Future<LocalStorage?> preInit() async {
    debugPrint("初始化本地存储LocalStorage");
    var prefs = await SharedPreferences.getInstance();
    _instance = LocalStorage._pre(prefs);
    return _instance;
  }

  String? getString(String key, {String? defValue = ''}) {
    return _prefs?.getString(key) ?? defValue;
  }

  Future<bool>? setString(String key, String value) {
    return _prefs?.setString(key, value);
  }

  bool? getBool(String key, {bool? defValue = false}) {
    return _prefs?.getBool(key) ?? defValue;
  }

  Future<bool>? setBool(String key, bool value) {
    return _prefs?.setBool(key, value);
  }

  //通过泛型来取值
  T? get<T>(String key) {
    return _prefs?.get(key) as T?;
  }
}
