import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../base/base_view_model.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class NameViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  late SharedPreferences prefs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    firstNameController.text = prefs.getString(AppStrings.firstName) ?? '';
    lastNameController.text = prefs.getString(AppStrings.lastName) ?? '';
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  void saveButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      SharedPrefs.save(
          key: AppStrings.firstName, value: firstNameController.text);
      SharedPrefs.save(
          key: AppStrings.lastName, value: lastNameController.text);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.accountProfileRoute, (route) => false);
    }
  }
}
