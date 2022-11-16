import 'package:flutter/material.dart';

import '../../../constants/const_colors.dart';
import '../../../constants/const_text_styles.dart';

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  const CategoryItem({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              border: Border.all(
                color: AppColors.neutralLight,
                width: 1,
              ),
            ),
            child: Image.asset(imagePath, scale: 20),
          ),
          const SizedBox(height: 8),
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
