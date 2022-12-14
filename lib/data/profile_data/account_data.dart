import "dart:convert";
import "dart:developer";

import "package:ecommerce_flutter/presentation/resources/strings_manager.dart";
import "package:shared_preferences/shared_preferences.dart";

class SharedPrefs {
  SharedPrefs();

  static Future<String?> read(String key) async {
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
      log("saved $value as Int in $key");
    } else if (type == String) {
      prefs.setString(key, value);
      log("saved $value as String in $key");
    } else if (type == double) {
      prefs.setDouble(key, value);
      log("saved $value as Double in $key");
    } else if (type == List<String>) {
      prefs.setStringList(key, value);
      log("saved $value in as List<String> $key");
    } else if (type == bool) {
      prefs.setBool(key, value);
      log("saved $value as bool in $key");
    }
  }

  static Future<void> delete(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);

    log("deleted $key");
  }

  List<Map<String, dynamic>> addressListHard = [
    {
      "address name": "Priscekila",
      "address street": "3711 Spring Hill Rd undefined Tallahassee,",
      "phone": "+99 1234567890",
      "state": "Nevada",
      "zip code": "52222",
      "country": "United States",
      "country code": "US",
      "address street 2": "Something,",
      "isDefault": true
    },
    {
      "address name": "Priscekila",
      "address street": "3711 Spring Hill Rd undefined Tallahassee,",
      "phone": "+99 1234567890",
      "state": "Nevada",
      "zip code": "52874",
      "country": "United States",
      "country code": "US",
      "address street 2": "Something,",
      "isDefault": false
    }
  ];

  List<Map<String, dynamic>> creditCardList = [
    {
      "number": "6969696969696969",
      "holder": "Lailyfa Febrina",
      "expireDate": "19/2042",
      "security code": "1010",
    },
    {
      "number": "6969696969696969",
      "holder": "Lailyfa Febrina",
      "expireDate": "19/2042",
      "security code": "1010",
    },
    {
      "number": "6969696969696969",
      "holder": "Lailyfa Febrina",
      "expireDate": "19/2042",
      "security code": "1010",
    },
  ];

  Future<void> addToList(Map<String, dynamic> data, String key) async {
    List list = json.decode((await read(key))!);
    list.add(data);
    saveModelList(list, key);
  }

  Future<void> updateList(
      Map<String, dynamic> data, int index, String key) async {
    List list = json.decode((await read(key))!);
    list[index] = data;
    saveModelList(list, key);
  }

  Future<void> removeList(int position, String key) async {
    List list = json.decode((await read(key))!);
    list.removeAt(position);
    // log("deleted at index $position ${addressList[position]}");

    saveModelList(list, key);
    log(list.toString());
  }

  Future<void> saveModelList(List modelList, String key) async {
    String list = json.encode(modelList);
    save(key: key, value: list);
  }

  Future<void> addDateTemp() async {
    save(key: AppStrings.firstName, value: "Thomas");
    save(key: AppStrings.lastName, value: "Meshail");
    save(key: AppStrings.userName, value: "@2Math");
    save(key: AppStrings.gender, value: AppStrings.male);
    save(key: AppStrings.birthday, value: "20-04-2000");
    save(key: AppStrings.email, value: "thomas.meshail@gmail.com");
    save(key: AppStrings.phoneNumber, value: "+201206207320");
    save(key: AppStrings.password, value: "0000");
    saveModelList(addressListHard, AppStrings.address);
    saveModelList(creditCardList, AppStrings.creditCardOrDebit);
  }
}
