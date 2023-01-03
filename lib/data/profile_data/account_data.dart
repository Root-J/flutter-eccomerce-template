import 'dart:developer';

import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs();

  static Future<String?> read(key) async {
    final prefs = await SharedPreferences.getInstance();
    String? value = prefs.getString(key);
    return value;
  }

  static Future<void> save(
      {required String key, required dynamic value}) async {
    final prefs = await SharedPreferences.getInstance();
    var type = value.runtimeType;
    if (type == int) {
      prefs.setInt(key, value);
    } else if (type == String) {
      prefs.setString(key, value);
    } else if (type == double) {
      prefs.setDouble(key, value);
    } else if (type == List<String>) {
      prefs.setStringList(key, value);
    } else if (type == bool) {
      prefs.setBool(key, value);
    }

    log('saved $value in $key');
  }

  static Future<void> delete(key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);

    log('deleted $key');
  }

  Future<void> addDateTemp() async {
    save(key: AppStrings.firstName, value: 'Thomas');
    save(key: AppStrings.lastName, value: 'Meshail');
    save(key: AppStrings.userName, value: '@2Math');
    save(key: AppStrings.gender, value: AppStrings.male);
    save(key: AppStrings.birthday, value: '20-04-2000');
    save(key: AppStrings.email, value: 'thomas.meshail@gmail.com');
    save(key: AppStrings.phoneNumber, value: '(+20) 1206207320');
    save(key: AppStrings.password, value: '123hi?/ as');
  }
}
