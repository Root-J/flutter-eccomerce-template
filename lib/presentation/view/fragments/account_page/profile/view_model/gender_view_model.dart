import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../base/base_view_model.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class GenderViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  String? gender;
  String? selectedValue;
  late SharedPreferences prefs;

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    gender = prefs.getString(AppStrings.gender);
    selectedValue = gender;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void saveButton(BuildContext context) {
    if (selectedValue != gender) {
      SharedPrefs.save(key: AppStrings.gender, value: selectedValue);
    }
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.accountProfileRoute, (route) => false);
  }
}
