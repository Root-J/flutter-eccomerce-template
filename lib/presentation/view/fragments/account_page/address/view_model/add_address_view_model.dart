import 'dart:developer';

import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:ecommerce_flutter/domain/models/cart_models/address_model.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../base/base_view_model.dart';

class AddAddressViewModel extends BaseViewModel
    with AddAddressViewModelInput, AddAddressViewModelOutput {
  String? countryValue = '';
  String? countryCode = '';
  String? stateValue = "";
  String? cityValue = '';
  String? address = "";

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController secondStreetAddressController =
      TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late SharedPreferences prefs;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    streetAddressController.dispose();
    secondStreetAddressController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
  }

  Map<String, dynamic> _changeDataToMap() {
    return {
      "address name": "${firstNameController.text} ${lastNameController.text}",
      "address street": streetAddressController.text,
      "phone": phoneNumberController.text,
      "state": stateController.text,
      "zip code": zipCodeController.text,
      "country": countryValue,
      "country code": countryCode,
      "address street 2": secondStreetAddressController.text,
      "isDefault": false,
    };
  }

  void addAddressToData() {
    SharedPrefs().addToAddress(_changeDataToMap(), AppStrings.address);
  }

  void getAddressFromIndex(AddressModel addressModel) {
    log(addressModel.toString());
    List<String> name = addressModel.name!.split(' ');
    firstNameController.text = name[0];
    if (name.length > 1) {
      lastNameController.text = name[1];
    } else {
      lastNameController.text = '';
    }
    streetAddressController.text = addressModel.street!;
    phoneNumberController.text = addressModel.phone!;
    stateController.text = addressModel.state!;
    zipCodeController.text = addressModel.zipCode!;
    countryValue = addressModel.country!;
    countryCode = addressModel.countryCode!;
    secondStreetAddressController.text = addressModel.street2 ?? '';
  }

  void updateAddress({required int index}) {
    SharedPrefs().updateAddress(_changeDataToMap(), index, AppStrings.address);
    // addAddressToData();
  }
}

abstract class AddAddressViewModelOutput {}

abstract class AddAddressViewModelInput {}
