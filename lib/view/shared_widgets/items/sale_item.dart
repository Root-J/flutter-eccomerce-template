import 'package:flutter/material.dart';

import '../../../constants/const_colors.dart';
import '../../../constants/const_text_styles.dart';

class SaleItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double actualCost;
  final int discount;
  final double netCost;
  final bool isGrid;
  final Size? size;

  const SaleItem({
    Key? key,
    required this.imagePath,
    required this.actualCost,
    required this.discount,
    required this.netCost,
    required this.productName,
    this.isGrid = false,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Image> stars = [
      Image.asset('assets/icons/Rating/star.png',
          color: AppColors.primaryYellow, scale: 40),
      Image.asset('assets/icons/Rating/star.png',
          color: AppColors.primaryYellow, scale: 40),
      Image.asset('assets/icons/Rating/star.png',
          color: AppColors.primaryYellow, scale: 40),
      Image.asset('assets/icons/Rating/star.png',
          color: AppColors.primaryYellow, scale: 40),
      Image.asset('assets/icons/Rating/star.png', scale: 40),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
          width: size == null ? 141 : null,
          height: size == null ? 238 : 320,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
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
                        borderRadius: BorderRadius.circular(5),
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
                Text('\$$netCost',
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
                    const SizedBox(width: 8),
                    Text('$discount% Off',
                        textAlign: TextAlign.left,
                        style: const AppTextStyles()
                            .captionNormalRegular
                            .copyWith(color: AppColors.primaryRed)),
                  ],
                ),
              ])),
    );
  }
}
