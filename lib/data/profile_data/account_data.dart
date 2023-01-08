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

  Future<void> addToAddress(Map<String, dynamic> address) async {
    List addressList = json.decode((await read(AppStrings.address))!);
    addressList.add(address);
    saveAddress(addressList);
  }

  Future<void> updateAddress(Map<String, dynamic> address, int index) async {
    List addressList = json.decode((await read(AppStrings.address))!);
    addressList[index] = address;
    saveAddress(addressList);
  }

  Future<void> removeAddress(int position) async {
    List addressList = json.decode((await read(AppStrings.address))!);
    log('${addressList.length} in remove');
    log('$addressList in remove');
    log(position.toString());
    addressList.removeAt(position);
    // log("deleted at index $position ${addressList[position]}");

    saveAddress(addressList);
    log(addressList.toString());
  }

  Future<void> saveAddress(List addressList) async {
    String address = json.encode(addressList);
    save(key: AppStrings.address, value: address);
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
    saveAddress(addressListHard);
  }
}
