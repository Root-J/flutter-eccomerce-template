import 'dart:async';

import 'package:ecommerce_flutter/domain/models/account_models/profile_models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../base/base_view_model.dart';
import '../../../../../resources/strings_manager.dart';

class ProfileViewModel extends BaseViewModel
    with ProfileViewModelInput, ProfileViewModelOutput {
  String? _firstName;
  String? _lastName;
  String? _userName;
  String? gender;
  String? birthday;
  String? email;
  String? phoneNumber;
  String? password;
  late SharedPreferences prefs;
  ProfileModel? model;

  final StreamController<ProfileModel> _streamController =
      StreamController<ProfileModel>.broadcast();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    _postDataToView(prefs);
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  void _postDataToView(prefs) {
    _firstName = prefs.getString(AppStrings.firstName);
    _lastName = prefs.getString(AppStrings.lastName);
    _userName = prefs.getString(AppStrings.userName);
    gender = prefs.getString(AppStrings.gender);
    birthday = prefs.getString(AppStrings.birthday);
    email = prefs.getString(AppStrings.email);
    phoneNumber = prefs.getString(AppStrings.phoneNumber);
    password = prefs.getString(AppStrings.password);
    model = ProfileModel(_firstName, _lastName, _userName, gender, birthday,
        email, phoneNumber, password);
  }

  @override
  Sink<ProfileModel> get inputProfileViewObject => _streamController.sink;

  @override
  Stream<ProfileModel> get outputProfileViewObject =>
      _streamController.stream.map((event) => event);
}

abstract class ProfileViewModelInput {
  Sink get inputProfileViewObject;
}

abstract class ProfileViewModelOutput {
  Stream get outputProfileViewObject;
}
