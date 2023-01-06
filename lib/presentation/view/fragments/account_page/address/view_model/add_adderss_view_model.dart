import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:flutter/material.dart';

import '../../../../../base/base_view_model.dart';

class AddAddressViewModel extends BaseViewModel
    with AddAddressViewModelInput, AddAddressViewModelOutput {
  String? countryValue = "";
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
  void start() async {}

  void addAddressToDate() {
    Map<String, dynamic> newAddress = {
      "address name": "${firstNameController.text} ${lastNameController.text}",
      "address street": streetAddressController.text,
      "phone": phoneNumberController.text,
      "state": stateController.text,
      "zip code": zipCodeController.text,
      "country": countryValue,
      "address street 2": secondStreetAddressController.text,
      "isDefault": false,
    };
    SharedPrefs().addToAddress(newAddress);
  }
}

abstract class AddAddressViewModelOutput {}

abstract class AddAddressViewModelInput {}
