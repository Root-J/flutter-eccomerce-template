import 'dart:async';
import 'dart:convert';

import 'package:ecommerce_flutter/domain/models/cart_models/address_model.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../base/base_view_model.dart';

class AddressViewModel extends BaseViewModel
    with AddressViewModelInput, AddressViewModelOutput {
  late final List<AddressModel> list;
  final StreamController<List<AddressModel>> _streamController =
      StreamController<List<AddressModel>>.broadcast();
  List addressList = [];
  late SharedPreferences prefs;

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    addressList = json.decode(prefs.getString(AppStrings.address)!);
    list = getAddresses;
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  List<AddressModel> get getAddresses {
    List<AddressModel> myList = [];
    for (var i in addressList) {
      myList.add(AddressModel(
          town: i['address town'],
          addressDetails: i["address details"],
          phone: i["phone"],
          isDefault: i["isDefault"]));
    }
    return myList;
  }

  @override
  void selectAddress(int selectedI) {
    // assign selected Address
    list[selectedI].isDefault = true;

    // make other addresses unavailable
    for (int i = 0; i < addressList.length; i++) {
      if (i != selectedI) {
        list[i].isDefault = false;
      }
    }
    _postDataToView();
  }

  void _postDataToView() {
    inputAddressViewObject.add(list);
  }

  @override
  Sink<List<AddressModel>> get inputAddressViewObject => _streamController.sink;

  @override
  Stream<List<AddressModel>> get outputAddressViewObject =>
      _streamController.stream.map((event) => event);
}

abstract class AddressViewModelOutput {
  Stream<List<AddressModel>> get outputAddressViewObject;
}

abstract class AddressViewModelInput {
  void selectAddress(int selectedI);
  Sink<List<AddressModel>> get inputAddressViewObject;
}
