import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';

class CategoryItem extends StatelessWidget {
  /// This Widget contains the Category item shape
  /// It's rounded circle with image inside it and a title below the circle
  /// it takes [imagePath] to show an image
  /// and a [title] that is below the circle
  ///
  /// Design role:
  /// fixed radius: 35
  /// image scale: 20
  /// vertical padding: 8

  final String imagePath;
  final String title;
  final double diameter;
  const CategoryItem({
    Key? key,
    required this.imagePath,
    required this.title,
    this.diameter = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        children: [
          Container(
            width: diameter,
            height: diameter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppCircularRadius.cr66),
              border: Border.all(
                color: AppColors.neutralLight,
                width: 1,
              ),
            ),
            child: Image.asset(imagePath, scale: AppSize.s20),
          ),
          const SizedBox(height: AppMargin.m8),
          Text(
            title,
            style: const AppTextStyles()
                .captionNormalRegular
                .copyWith(color: AppColors.neutralGrey),
          )
        ],
      ),
    );
  }
}
