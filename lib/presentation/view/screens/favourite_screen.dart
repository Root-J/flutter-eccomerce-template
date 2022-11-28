import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../shared_widgets/items/sale_item.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> sales = [
    {
      'image': ProductImage.nikeYellowShoeImage,
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
    },
    {
      'image': ProductImage.womanBlackBagImage,
      'name': 'FS - QUILTED MAXI CROS...',
      'actual_cost': 534.33,
      'discount': 24,
    },
    {
      'image': ProductImage.nikeRedShoeImage,
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
    },
    {
      'image': ProductImage.nikeYellowShoeImage,
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
    },
    {
      'image': ProductImage.womanBlackBagImage,
      'name': 'FS - QUILTED MAXI CROS...',
      'actual_cost': 534.33,
      'discount': 24,
    },
    {
      'image': ProductImage.nikeRedShoeImage,
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
    },
    {
      'image': ProductImage.nikeYellowShoeImage,
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App Bar
            HeaderPadding(
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: AppColors.neutralGrey)),
                  Text(
                    '${AppStrings.favourite} ${AppStrings.product}',
                    style: const AppTextStyles().bodyTextLargeBold,
                  )
                ],
              ),
            ),
            GridView.builder(
              // ToDo add Api call that creates Sales Item Grid list
              shrinkWrap: true,
              itemCount: sales.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SaleItem(
                  imagePath: sales[index]['image'],
                  actualCost: sales[index]['actual_cost'],
                  discount: sales[index]['discount'],
                  productName: sales[index]['name'],
                  isGrid: true,
                  isDeletable: true,
                  size: size),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                childAspectRatio: ((size.width / 2) - (8 * 3)) / 280,
              ),
            )
          ],
        ),
      ),
    );
  }
}
