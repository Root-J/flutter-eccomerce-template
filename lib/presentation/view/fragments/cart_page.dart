import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/decoration_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/dashed_separator.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/text_header.dart';
import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../../resources/text_styles_manager.dart';
import '../../resources/values_manager.dart';
import '../shared_widgets/default_button.dart';
import '../shared_widgets/items/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
  final double shippingPrice = 40.0;
  final double importCharges = 128.0;

  final TextEditingController couponController = TextEditingController();

  int get _getItemsNumber {
    int numberOfItems = 0;
    for (int i = 0; i < cartList.length; i++) {
      numberOfItems += cartList[i]['number of items'] as int;
    }
    return numberOfItems;
  }

  double get _getTotalItemsPrice {
    double total = 0;
    for (int i = 0; i < cartList.length; i++) {
      total += cartList[i]['price'] as double;
    }
    return total;
  }

  double get _getTotalPrice {
    double total = 0;
    total += _getTotalItemsPrice;
    total += shippingPrice;
    total += importCharges;
    return total;
  }

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
                  imagePath: cartList[i]['imagePath'],
                  title: cartList[i]['title'],
                  price: cartList[i]['price'],
                  numberOfItems: cartList[i]['number of items']),
          ]),
          const SizedBox(height: AppMargin.m16),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextField(
                    controller: couponController,
                    style: const AppTextStyles()
                        .formTextFill
                        .copyWith(color: AppColors.neutralGrey),
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p20,
                            horizontal: AppPadding.p16),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppCircularRadius.cr5),
                              bottomLeft:
                                  Radius.circular(AppCircularRadius.cr5)),
                          borderSide: BorderSide(color: AppColors.primaryBlue),
                        ),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(AppCircularRadius.cr5),
                                bottomLeft:
                                    Radius.circular(AppCircularRadius.cr5)),
                            borderSide:
                                BorderSide(color: AppColors.neutralLight)),
                        isDense: true,
                        hintText:
                            '${AppStrings.enter} ${AppStrings.couponCode}',
                        hintStyle: const AppTextStyles()
                            .formTextFill
                            .copyWith(color: AppColors.neutralGrey))),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.all(AppPadding.p20),
                    backgroundColor: AppColors.primaryBlue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppCircularRadius.cr5),
                            bottomRight:
                                Radius.circular(AppCircularRadius.cr5)))),
                onPressed: () {},
                child: Text(
                  AppStrings.apply,
                  style: const AppTextStyles()
                      .headingH5
                      .copyWith(color: AppColors.backgroundWhite),
                ),
              )
            ],
          ),
          const SizedBox(height: AppMargin.m16),
          Container(
              decoration: AppDecoration.lightRoundedBorder,
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${AppStrings.items} ($_getItemsNumber)',
                          style: const AppTextStyles()
                              .bodyTextNormalRegular
                              .copyWith(color: AppColors.neutralGrey)),
                      Text('\$$_getTotalItemsPrice',
                          style: const AppTextStyles()
                              .bodyTextNormalRegular
                              .copyWith(color: AppColors.neutralDark))
                    ]),
                const SizedBox(height: AppMargin.m16),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.shopping,
                          style: const AppTextStyles()
                              .bodyTextNormalRegular
                              .copyWith(color: AppColors.neutralGrey)),
                      Text('\$$shippingPrice',
                          style: const AppTextStyles()
                              .bodyTextNormalRegular
                              .copyWith(color: AppColors.neutralDark))
                    ]),
                const SizedBox(height: AppMargin.m16),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.importCharges,
                          style: const AppTextStyles()
                              .bodyTextNormalRegular
                              .copyWith(color: AppColors.neutralGrey)),
                      Text('\$$importCharges',
                          style: const AppTextStyles()
                              .bodyTextNormalRegular
                              .copyWith(color: AppColors.neutralDark))
                    ]),
                const Padding(
                    padding: EdgeInsets.all(AppPadding.p16),
                    child: DashedSeparator()),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.totalPrice,
                          style: const AppTextStyles()
                              .headingH6
                              .copyWith(color: AppColors.neutralDark)),
                      Text('\$$_getTotalPrice',
                          style: const AppTextStyles()
                              .headingH6
                              .copyWith(color: AppColors.primaryBlue))
                    ]),
              ])),
          const SizedBox(height: AppMargin.m16),
          DefaultButton(
            size: size,
            title: AppStrings.checkOut,
          ),
        ],
      ),
    );
  }
}
