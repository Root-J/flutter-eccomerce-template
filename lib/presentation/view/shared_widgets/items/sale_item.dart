import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';

class SaleItem extends StatelessWidget {
  /// This widget represent the market item with discount
  /// but there's two types of discounted items
  /// on with rating
  /// and another without stars rating
  /// [imagePath] is the image of the product
  /// [productName] is the name of the product
  /// [actualCost] the actual cost od the product before  the discount which is in red color and has a line through (deleted)
  /// [discount] the percent of the discount

  /// optional [isGrid] the star rating only shows in grid lists so if it's gird the star will shows
  /// and the items will scale up two fit two items in one screen
  /// optional [size] to see what size you want for width only but height is fixed 238 in usual and 320 in grid for stars height
  /// int [rating] is the number of stars for the item
  /// the class has ratingDrawer() to make stars list for the given rating
  ///
  final String imagePath;
  final String productName;
  final double actualCost;
  final int discount;
  final bool isGrid;
  final int? rating;
  final Size? size;
  final bool isDeletable;

  const SaleItem({
    Key? key,
    required this.imagePath,
    required this.actualCost,
    required this.discount,
    required this.productName,
    this.isGrid = false,
    this.size,
    this.rating,
    this.isDeletable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Image> stars = [];

    void ratingDrawer(rating) {
      // This function is responsible for creating rating stars list of widgets
      // as number of highest rated item is 5 stars
      // then it can't proceed to 6
      for (int i = 0; i < 6; i++) {
        if (i <= rating) {
          stars.add(Image.asset('assets/icons/Rating/star.png',
              color: AppColors.primaryYellow, scale: AppSize.s40));
        } else {
          stars.add(
              Image.asset('assets/icons/Rating/star.png', scale: AppSize.s40));
        }
      }
    }

    if (rating != null) {
      ratingDrawer(rating);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
      child: Container(
          width: size == null ? 141 : null,
          height: size == null ? 238 : 320,
          padding: const EdgeInsets.all(AppPadding.p8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
              border: Border.all(color: AppColors.neutralLight)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Container(
                      width: size == null ? 109 : size!.width / 2 - (8 * 4),
                      height: 109,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppCircularRadius.cr5),
                        image: DecorationImage(
                            image: AssetImage(imagePath), fit: BoxFit.fitWidth),
                      )),
                ),
                Text(productName,
                    textAlign: TextAlign.left,
                    style: const AppTextStyles()
                        .bodyTextNormalBold
                        .copyWith(color: AppColors.neutralDark)),
                if (isGrid) Row(children: stars),
                Text(
                    '\$${(actualCost - (actualCost * discount ~/ 100)).round()}',
                    textAlign: TextAlign.left,
                    style: const AppTextStyles()
                        .bodyTextNormalRegular
                        .copyWith(color: AppColors.primaryBlue)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('\$$actualCost',
                        textAlign: TextAlign.left,
                        style: const AppTextStyles()
                            .captionNormalRegularLine
                            .copyWith(color: AppColors.neutralGrey)),
                    const SizedBox(width: AppMargin.m8),
                    Text('$discount% Off',
                        textAlign: TextAlign.left,
                        style: const AppTextStyles()
                            .captionNormalRegular
                            .copyWith(color: AppColors.primaryRed)),
                    Visibility(
                      visible: isDeletable,
                      child: Expanded(
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(SystemIcons.trashIcon,
                              scale: AppSize.s24),
                        ),
                      ),
                    )
                  ],
                ),
              ])),
    );
  }
}
