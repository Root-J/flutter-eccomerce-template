import 'dart:async';

import 'package:flutter/cupertino.dart';

import '/presentation/base/base_view_model.dart';
import '../fragments/account_page/account_page.dart';
import '../fragments/cart_page/view/cart_page.dart';
import '../fragments/explore_page.dart';
import '../fragments/home_page.dart';
import '../fragments/offer_page.dart';

class MarketParentViewModel extends BaseViewModel
    with ParentViewInput, ParentViewOutput {
  // This View Model
  // it's view should run a function
  // that change the current index value
  // and return a state class
  // stream controllers

  // // TODO : remove broadcast() method it's only there for developing process
  // final StreamController _streamController =
  //     StreamController<Widget>.broadcast();

  late List<Widget> _list;

  int _currentIndex = 0;

  // inputs
  @override
  void dispose() {
    // _streamController.close();
  }

  List<Widget> get getPagesList => _list;

  @override
  void start() {
    _list = _getPages();
    // _postDataToView();
  }


  int get getCurrentIndex => _currentIndex;
  void setIndex(int index) => _currentIndex = index;

  @override
  Sink get inputNavViewObject => throw UnimplementedError();

  // _streamController.sink;

  // outputs
  @override
  Stream<Widget> get outputNavViewObject => throw UnimplementedError();

  // _streamController.stream.map((screen) => screen);

  // private functions
  List<Widget> _getPages() => [
        HomePage(),
        ExplorePage(),
        const CartPage(),
        const OfferPage(),
        const AccountPage(),
      ];
// void _postDataToView() {
//   inputNavViewObject.add(_list[_currentIndex]);
// }
}

// inputs mean the orders that our view model will receive from our view
mixin ParentViewInput on BaseViewModel {
  // void onPageChanged(int index);

  Sink
      get inputNavViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean data or results that will be sent from our view model to our view
mixin ParentViewOutput on BaseViewModel {
  Stream get outputNavViewObject;
}

class ParentIndexParams {
  final int intIndex;

  const ParentIndexParams({required this.intIndex});
}
