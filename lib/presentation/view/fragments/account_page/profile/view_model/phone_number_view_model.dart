import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../base/base_view_model.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class PhoneNumberViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  String? phoneNumber;
  late SharedPreferences prefs;
  PhoneNumber? number;

  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString(AppStrings.phoneNumber);
    number = phoneNumber != null
        ? await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber!)
        : null;
    phoneNumberController.text = number!.phoneNumber!;
    log(number.toString());
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  void saveButton(BuildContext context) {
    formKey.currentState?.save();
    if (formKey.currentState!.validate() &&
        phoneNumber != phoneNumberController.text) {
      SharedPrefs.save(
          key: AppStrings.phoneNumber, value: number?.phoneNumber.toString());
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.accountProfileRoute, (route) => false);
    }
  }
}
