import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../base/base_view_model.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class GenderViewModel extends BaseViewModel
    with GenderViewModelInput, GenderViewModelOutput {
  String? gender;
  String? selectedValue;
  late SharedPreferences prefs;

  final StreamController<GenderModel> _streamController =
      StreamController<GenderModel>.broadcast();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    gender = prefs.getString(AppStrings.gender);
    selectedValue = gender;
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  void saveButton(BuildContext context) {
    if (selectedValue != gender) {
      SharedPrefs.save(key: AppStrings.gender, value: selectedValue);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.accountProfileRoute, (route) => false);
    }
  }

  @override
  void onChange(String selection) {
    selectedValue = selection;
  }

  @override
  Sink get inputGenderViewObject => _streamController.sink;

  @override
  Stream<GenderModel> get outputGenderViewObject =>
      _streamController.stream.map((event) => event);
}

abstract class GenderViewModelInput {
  void onChange(String selection);
  Sink get inputGenderViewObject;
}

abstract class GenderViewModelOutput {
  Stream get outputGenderViewObject;
}

class GenderModel {
  final String? gender;
  const GenderModel(this.gender);
}
