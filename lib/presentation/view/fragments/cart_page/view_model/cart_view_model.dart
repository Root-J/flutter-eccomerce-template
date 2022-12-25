import '/presentation/base/base_view_model.dart';
import '../../../../../domain/models/cart_models/cart_items_model.dart';
import '../../../../resources/assets_manager.dart';

class CartViewModel extends BaseViewModel with CartViewInput, CartViewOutput {
  // This View Model
  // it's view should run a function
  // that change the current index value
  // and return a state class
  // stream controllers

  // final StreamController _streamController = StreamController<CartItemModels>();

  late final List list;
  List<Map<String, dynamic>> cartItems = [
    {
      'imagePath': ProductImage.nikeBlueShoeImage,
      'title': 'Nike Air Zoom Pegasus 36 Miami',
      'price': 300.43,
      'number of items': 2,
    },
    {
      'imagePath': ProductImage.nikeRedShoeImage,
      'title': 'Nike Air Zoom Pegasus 36 Miami',
      'price': 299.43,
      'number of items': 1,
    }
  ];

  // inputs
  @override
  void dispose() {
    // _streamController.close();
  }

  @override
  void start() {
    list = _getData();
    _postDataToView();
  }

  int get getItemsNumber {
    int numberOfItems = 0;
    for (int i = 0; i < cartItems.length; i++) {
      numberOfItems += cartItems[i]['number of items'] as int;
    }
    return numberOfItems;
  }

  double get getTotalItemsPrice {
    double total = 0;
    for (int i = 0; i < cartItems.length; i++) {
      total += cartItems[i]['price'] as double;
    }
    return total;
  }

  final double shippingPrice = 40.0;
  final double importCharges = 128.0;

  double get getTotalPrice {
    double total = 0;
    total += getTotalItemsPrice;
    total += shippingPrice;
    total += importCharges;
    return total;
  }

  // @override
  // StreamSink get inputCartViewObject => _streamController.sink;

  // outputs
  // @override
  // Stream<List<CartItemModels>> get outputCartViewObject =>
  //     _streamController.stream.map((cartItem) => cartItem);

  // private functions
  List<CartItemModels> _getData() {
    List<CartItemModels> models = [];
    for (var i in cartItems) {
      models.add(CartItemModels(
          image: i["imagePath"],
          title: i["title"],
          price: i['price'],
          isFavourite: false,
          count: i["number of items"]));
    }
    return models;
  }

  void _postDataToView() {
    // int i = 0;
    // while (i < _list.length) {
    //   log(i.toString());
    //   inputCartViewObject.add(_list[i]);
    //   i++;
    // }
  }
}

//
// inputs mean the orders that our view model will receive from our view
abstract class CartViewInput {
  // Sink
  //     get inputCartViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean data or results that will be sent from our view model to our view
abstract class CartViewOutput {
  // Stream get outputCartViewObject;
}
