import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../base/base_view_model.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';

class GenderViewModel extends BaseViewModel
    with GenderViewModelInput, GenderViewModelOutput {
  String? _gender;
  String? _selectedValue;
  late SharedPreferences prefs;

  final StreamController<GenderModel> _streamController =
      StreamController<GenderModel>.broadcast();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    _gender = prefs.getString(AppStrings.gender);
    _selectedValue = _gender;
    _postDateToView(_selectedValue!);
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  void _postDateToView(String gender) {
    inputGenderViewObject.add(GenderModel(gender));
  }

  void saveButton(BuildContext context) {
    if (_selectedValue != _gender) {
      SharedPrefs.save(key: AppStrings.gender, value: _selectedValue);
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.accountProfileRoute, (route) => false);
    }
  }

  @override
  void onChange(String selection) {
    _selectedValue = selection;
    _postDateToView(_selectedValue!);
  }

  @override
  Sink<GenderModel> get inputGenderViewObject => _streamController.sink;

  @override
  Stream<GenderModel> get outputGenderViewObject =>
      _streamController.stream.map((event) => event);
}

abstract class GenderViewModelInput {
  void onChange(String selection);
  Sink<GenderModel> get inputGenderViewObject;
}

abstract class GenderViewModelOutput {
  Stream<GenderModel> get outputGenderViewObject;
}

class GenderModel {
  final String? gender;
  const GenderModel(this.gender);
}
