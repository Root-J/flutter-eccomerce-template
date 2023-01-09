import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce_flutter/presentation/base/base_view_model.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../data/profile_data/account_data.dart';
import '../../../../../../domain/models/account_models/payment_model.dart';

class CardViewModel extends BaseViewModel
    with CardViewModelInput, CardViewModelOutput {
  late List<CreditCardModel>? list;
  final StreamController<List<CreditCardModel>> _streamController =
      StreamController<List<CreditCardModel>>.broadcast();
  List? cardList = [];
  late SharedPreferences prefs;
  final SharedPrefs customPref = SharedPrefs();

  @override
  void start() async {
    prefs = await SharedPreferences.getInstance();
    cardList = json.decode(prefs.getString(AppStrings.creditCardOrDebit)!);
    list = getCards;
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  List<CreditCardModel>? get getCards {
    List<CreditCardModel> myList = [];
    if (cardList != null) {
      for (var item in cardList!) {
        myList.add(CreditCardModel.fromJson(item));
      }
      log(myList.toString());
      return myList;
    }
    return null;
  }

  void removeCard(int index) async {
    await customPref.removeList(index, AppStrings.creditCardOrDebit);
    start();
  }

  void _postDataToView() {
    if (list != null) {
      inputCardViewObject.add(list!);
    } else {
      inputCardViewObject.add([]);
    }
  }

  @override
  Sink<List<CreditCardModel>> get inputCardViewObject => _streamController.sink;

  @override
  Stream<List<CreditCardModel>> get outputCardViewObject =>
      _streamController.stream.map((event) => event);
}

abstract class CardViewModelOutput {
  Stream<List<CreditCardModel>> get outputCardViewObject;
}

abstract class CardViewModelInput {
  Sink<List<CreditCardModel>> get inputCardViewObject;
}
