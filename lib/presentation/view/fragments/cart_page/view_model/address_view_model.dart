import 'dart:async';

import 'package:ecommerce_flutter/domain/models/cart_models/address_model.dart';

import '../../../../base/base_view_model.dart';

class AddressViewModel extends BaseViewModel
    with AddressViewModelInput, AddressViewModelOutput {
  late final List<AddressModel> list;
  final StreamController<AddressModel> _streamController =
      StreamController<AddressModel>();
  final List<Map<String, dynamic>> addressList = [
    {
      'address town': 'Priscekila',
      'address details':
          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
      'phone': '+99 1234567890',
      'isDefault': true,
    },
    {
      'address town': 'Priscekila',
      'address details':
          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
      'phone': '+99 1234567890',
      'isDefault': false,
    },
  ];

  @override
  void start() {
    list = getAddresses;
    _postDataToView();
  }

  @override
  void dispose() {}

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
    for (int i = 0; i < list.length; i++) {
      inputAddressViewObject.add(list[i]);
    }
  }

  @override
  Sink get inputAddressViewObject => _streamController.sink;

  @override
  Stream get outputAddressViewObject =>
      _streamController.stream.map((event) => event);
}

abstract class AddressViewModelOutput {
  void selectAddress(int selectedI);
  Sink get inputAddressViewObject;
}

abstract class AddressViewModelInput {
  Stream get outputAddressViewObject;
}
