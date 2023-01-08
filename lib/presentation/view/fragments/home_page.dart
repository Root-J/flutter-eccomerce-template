import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';
import '../shared_widgets/bars/active_search_app_bar_.dart';
import '../shared_widgets/bars/see_more_bar.dart';
import '../shared_widgets/items/category_item.dart';
import '../shared_widgets/items/sale_item.dart';
import '../shared_widgets/items/sales_ad.dart';
import '../shared_widgets/slide_show.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

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

  final List<List<String>> categories = [
    ['Bikini', ProductIcon.bikiniProductIcon],
    ['Dress', ProductIcon.dressProductIcon],
    ['Man Bag', ProductIcon.manBagProductIcon],
    ['Man Pants', ProductIcon.manPantsProductIcon],
    ['Man Shoes', ProductIcon.manShoesProductIcon],
    ['Man Underwear', ProductIcon.manUnderwearProductIcon],
    ['Shirt', ProductIcon.shirtProductIcon],
    ['Skirt', ProductIcon.skirtProductIcon],
    ['T-shirt', ProductIcon.tshirtProductIcon],
    ['Woman Bag', ProductIcon.womanBagProductIcon],
    ['Woman Pants', ProductIcon.womanPantsProductIcon],
    ['Woman Shoes', ProductIcon.womanShoesProductIcon],
    ['Woman T-shirt', ProductIcon.womanTshirtProductIcon],
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header Bar
          HeaderPadding(
            widget: AppBarActiveSearch(
                searchController: searchController,
                searchFocusNode: searchFocusNode),
          ),

          // Image Slide show makes a beautiful auto player for any types of list
          Slideshow(
            indicatorColor: AppColors.primaryBlue,
            /*
            onPageChanged: (value) {
               debugPrint('Page changed: $value');
            },
            */
            autoPlayInterval: 6000,
            isLoop: true,
            children: [
              const SaleAd(
                  // Todo Add Api call that create sale Ad
                  bgImagePath: PromotionImage.redShoeImage,
                  widget: SaleAdClock(
                      seconds: 30000,
                      saleName: 'Super Flash Sale',
                      discount: 50)),
              Image.asset(
                PromotionImage.redShoeImage,
                fit: BoxFit.fill,
              ),
              Image.asset(
                PromotionImage.redShoeImage,
                fit: BoxFit.fill,
              ),
            ],
          ),
          //Categories
          SeeMoreBar(
              onTap: () {},
              title: AppStrings.category,
              txtButton: AppStrings.moreCategory),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                // display each item of the product list
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(
                      imagePath: categories[index][1],
                      title: categories[index][0]);
                }),
          ),

          //Flash Sale
          const SizedBox(height: AppMargin.m24),
          SeeMoreBar(onTap: () {}, title: AppStrings.flashSale),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // the number of items in the list
                itemCount: sales.length,
                // display each item of the product list
                itemBuilder: (BuildContext context, int index) {
                  return SaleItem(
                      // ToDo Add Api call that create flash sales List
                      imagePath: sales[index]['image'],
                      actualCost: sales[index]['actual_cost'],
                      discount: sales[index]['discount'],
                      productName: sales[index]['name']);
                }),
          ),

          //Mega Sale
          const SizedBox(height: AppMargin.m24),
          SeeMoreBar(onTap: () {}, title: AppStrings.megaSale),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // the number of items in the list
                itemCount: sales.length,
                // display each item of the product list
                itemBuilder: (BuildContext context, int index) {
                  return SaleItem(
                      // ToDo Add Api call that creates Mega Sale List
                      imagePath: sales[index]['image'],
                      actualCost: sales[index]['actual_cost'],
                      discount: sales[index]['discount'],
                      productName: sales[index]['name']);
                }),
          ),
          const SaleAd(
              // ToDo Add Api call that creates Sale AD
              bgImagePath: PromotionImage.whiteShoeImage,
              widget: RecommendationTexts(
                title: 'Recommended Product',
                subtitle: 'We recommend the best for you',
              )),
          const SizedBox(height: AppMargin.m8),
          //Grid Products
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
    );
  }
}
