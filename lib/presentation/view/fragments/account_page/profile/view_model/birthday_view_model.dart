import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../base/base_view_model.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class BirthdayViewModel extends BaseViewModel
    with BaseViewModelInputs, BaseViewModelOutputs {
  DateTime? birthday;
  late SharedPreferences prefs;

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    String? temp = prefs.getString(AppStrings.birthday);
    if (temp != null) {
      birthday = DateFormat('dd-MM-yyyy').parse(temp);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void saveButton(BuildContext context) {
    SharedPrefs.save(
        key: AppStrings.birthday,
        value: DateFormat('dd-MM-yyyy').format(birthday!));
    Navigator.pushNamed(context, Routes.accountProfileRoute);
  }
}
