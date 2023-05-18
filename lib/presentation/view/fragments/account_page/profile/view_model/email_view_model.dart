import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../base/base_view_model.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class EmailViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  String? email;
  late SharedPreferences prefs;

  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    email = prefs.getString(AppStrings.email);
    emailController.text = email!;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  void saveButton(BuildContext context) {
    if (formKey.currentState!.validate() && email != emailController.text) {
      SharedPrefs.save(key: AppStrings.email, value: emailController.text);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.accountProfileRoute, (route) => false);
    }
  }
}
