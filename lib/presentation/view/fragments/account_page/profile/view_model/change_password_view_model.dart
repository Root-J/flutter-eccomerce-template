import 'package:ecommerce_flutter/presentation/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/validation/password_validator.dart';
import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class ChangePasswordViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  String? oldPassword;
  late SharedPreferences prefs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    oldPassword = prefs.getString(AppStrings.password);
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    newPasswordAgainController.dispose();
    newPasswordController.dispose();
  }

  String? oldPasswordMatch(String? val) {
    if (val != oldPassword) {
      return AppStrings.passwordNotMatchingMessage;
    }
    return null;
  }

  String? newPasswordFormat(String? val) {
    if (!PasswordValidator().validate(val)) {
      return PasswordValidator().getMessage();
    }
    return null;
  }

  String? newPasswordMatch(String? val) {
    if (newPasswordController.text != val) {
      return AppStrings.passwordNotMatchingMessage;
    }
    return null;
  }

  void saveButton(BuildContext context) {
    if (formKey.currentState!.validate() &&
        newPasswordController.text != oldPassword) {
      SharedPrefs.save(
          key: AppStrings.password, value: newPasswordAgainController.text);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.accountProfileRoute, (route) => false);
    }
  }
}
