import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/active_search_app_bar_.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../shared_widgets/items/category_Item.dart';

class ExplorePage extends StatelessWidget {
  final FocusNode searchFocusNode = FocusNode();
  final TextEditingController searchController = TextEditingController();

  ExplorePage({Key? key}) : super(key: key);
  final List<List<String>> manCategories = [
    ['Man Bag', ProductIcon.manBagProductIcon],
    ['Man Pants', ProductIcon.manPantsProductIcon],
    ['Man Shoes', ProductIcon.manShoesProductIcon],
    ['Man Underwear', ProductIcon.manUnderwearProductIcon],
    ['Man Shirt', ProductIcon.shirtProductIcon],
    ['T-shirt', ProductIcon.tshirtProductIcon],
  ];
  final List<List<String>> womanCategories = [
    ['Bikini', ProductIcon.bikiniProductIcon],
    ['Dress', ProductIcon.dressProductIcon],
    ['Skirt', ProductIcon.skirtProductIcon],
    ['Woman Bag', ProductIcon.womanBagProductIcon],
    ['Woman Pants', ProductIcon.womanPantsProductIcon],
    ['Woman Shoes', ProductIcon.womanShoesProductIcon],
    ['Woman T-shirt', ProductIcon.womanTshirtProductIcon],
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        HeaderPadding(
            widget: AppBarActiveSearch(
                searchController: searchController,
                searchFocusNode: searchFocusNode)),
        Text(
          '${AppStrings.man} ${AppStrings.fashion}',
          style: const AppTextStyles()
              .headingH5
              .copyWith(color: AppColors.neutralDark),
        ),
        const SizedBox(height: AppMargin.m8),
        Wrap(children: [
          for (int i = 0; i < manCategories.length; i++)
            CategoryItem(
                imagePath: manCategories[i][1], title: manCategories[i][0]),
        ]),
        const SizedBox(height: AppMargin.m8),
        Text(
          '${AppStrings.woman} ${AppStrings.fashion}',
          style: const AppTextStyles()
              .headingH5
              .copyWith(color: AppColors.neutralDark),
        ),
        const SizedBox(height: AppMargin.m8),
        Wrap(
          children: [
            for (int i = 0; i < womanCategories.length; i++)
              CategoryItem(
                  imagePath: womanCategories[i][1],
                  title: womanCategories[i][0]),
          ],
        ),
      ]),
    );
  }
}
