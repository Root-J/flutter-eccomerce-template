import 'dart:async';

import 'package:ecommerce_flutter/domain/models/account_models/profile_models/profile_model.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/base/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends BaseViewModel
    with ProfileViewModelInput, ProfileViewModelOutput {
  String? _firstName;
  String? _lastName;
  String? _userName;
  String? _gender;
  String? _birthday;
  String? _email;
  String? _phoneNumber;
  String? _password;
  late SharedPreferences prefs;
  ProfileModel? _model;

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
    _gender = prefs.getString(AppStrings.gender);
    _birthday = prefs.getString(AppStrings.birthday);
    _email = prefs.getString(AppStrings.email);
    _phoneNumber = prefs.getString(AppStrings.phoneNumber);
    _password = prefs.getString(AppStrings.password);
    _model = ProfileModel(_firstName, _lastName, _userName, _gender, _birthday,
        _email, _phoneNumber, _password);
    inputProfileViewObject.add(_model!);
  }

  @override
  Sink<ProfileModel> get inputProfileViewObject => _streamController.sink;

  @override
  Stream<ProfileModel> get outputProfileViewObject =>
      _streamController.stream.map((event) => event);
}

mixin ProfileViewModelInput on BaseViewModel {
  Sink<ProfileModel> get inputProfileViewObject;
}

mixin ProfileViewModelOutput on BaseViewModel {
  Stream<ProfileModel> get outputProfileViewObject;
}
