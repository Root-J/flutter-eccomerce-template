import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:ecommerce_flutter/domain/models/account_models/payment_model.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../base/base_view_model.dart';

class CardDetailsViewModel extends BaseViewModel
    with CardDetailsViewModelInput, CardDetailsViewModelOutput {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expirationDateController =
      TextEditingController();
  final TextEditingController securityCodeController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late SharedPreferences prefs;
  late SharedPrefs customPref;

  @override
  void dispose() {
    cardNumberController.dispose();
    expirationDateController.dispose();
    securityCodeController.dispose();
    cardHolderController.dispose();
    super.dispose();
  }

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    customPref = SharedPrefs();
  }

  Map<String, dynamic> _changeDataToMap() => {
        "number": cardNumberController.text,
        "holder": cardHolderController.text.toUpperCase(),
        "expireDate": expirationDateController.text,
        "security code": securityCodeController.text,
      };

  void getCardDetailsFromIndex(CreditCardModel model) {
    cardNumberController.text = model.number!;
    expirationDateController.text = model.expireDate!;
    securityCodeController.text = model.securityCode!;
    cardHolderController.text = model.holder!;
  }

  void addCardDetailsToData() {
    customPref.addToList(_changeDataToMap(), AppStrings.creditCardOrDebit);
  }

  void updateCardDetails({required int index}) {
    customPref.updateList(
        _changeDataToMap(), index, AppStrings.creditCardOrDebit);
    // addCardDetailsToData();
  }
}

abstract class CardDetailsViewModelOutput {}

abstract class CardDetailsViewModelInput {}
