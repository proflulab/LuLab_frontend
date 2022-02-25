import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Storage {
  static Future<int?> setInt(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt(key, value);
    return null;
  }

  static Future<int?> getInt(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getInt(key);
  }

  static Future<bool?> setJson(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, jsonEncode(value));
  }

  static Future<String?> getJson(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static Future<bool?> setBool(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
    return null;
  }

  static Future<bool?> getBool(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

  static Future<void> setString(key, value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  //新版shared_preferences增加了可空类型 ，返回类型需要定义成 Future<String?> 的可空类型
  static Future<String?> getString(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static Future<void> remove(key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  static Future<void> clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
