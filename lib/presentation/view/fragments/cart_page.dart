import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/text_header.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/items/cart_item.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> cartList = [
    {
      'imagePath': ProductImage.nikeBlueShoeImage,
      'title': 'Nike Air Zoom Pegasus 36 Miami',
      'price': 299.43,
      'number of items': 2,
    },
    {
      'imagePath': ProductImage.nikeRedShoeImage,
      'title': 'Nike Air Zoom Pegasus 36 Miami',
      'price': 299.43,
      'number of items': 1,
    }
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderPadding(
              widget:
                  TextHeader(text: '${AppStrings.your} ${AppStrings.cart}')),
          Wrap(children: [
            for (int i = 0; i < cartList.length; i++)
              CartItem(
                  size: size,
                  imagePath: cartList[i]['imagePath'],
                  title: cartList[i]['title'],
                  price: cartList[i]['price'],
                  numberOfItems: cartList[i]['number of items']),
          ])
        ],
      ),
    );
  }
}
