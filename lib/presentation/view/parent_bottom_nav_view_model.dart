import 'dart:async';

import 'package:flutter/cupertino.dart';

import '/presentation/base/base_view_model.dart';
import 'fragments/account_page.dart';
import 'fragments/cart_page/cart_page.dart';
import 'fragments/explore_page.dart';
import 'fragments/home_page.dart';
import 'fragments/offer_page.dart';

class MarketParentViewModel extends BaseViewModel
    with ParentViewInput, ParentViewOutput {
  // This View Model
  // it's view should run a function
  // that change the current index value
  // and return a state class
  // stream controllers

  // TODO : remove braodcast() method it's only there for developing process
  final StreamController _streamController =
      StreamController<Widget>.broadcast();

  late final List _list;

  int _currentIndex = 0;

  // inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getPages();
    // send this slider data to our view
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  int get getCurrentIndex {
    return _currentIndex;
  }

  @override
  Sink get inputNavViewObject => _streamController.sink;

  // outputs
  @override
  Stream<Widget> get outputNavViewObject =>
      _streamController.stream.map((screen) => screen);

  // private functions
  List _getPages() => [
        HomePage(),
        ExplorePage(),
        const CartPage(),
        const OfferPage(),
        const AccountPage(),
      ];

  void _postDataToView() {
    inputNavViewObject.add(_list[_currentIndex]);
  }
}

//
// inputs mean the orders that our view model will receive from our view
abstract class ParentViewInput {
  void onPageChanged(int index);

  Sink
      get inputNavViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean data or results that will be sent from our view model to our view
abstract class ParentViewOutput {
  Stream get outputNavViewObject;
}
