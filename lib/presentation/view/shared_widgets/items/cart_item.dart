import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/colors_manager.dart';
import '../../../resources/decoration_mananger.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';

class CartItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final double price;
  final int numberOfItems;
  const CartItem({
    Key? key,
    required this.size,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.numberOfItems,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Container(
        decoration: AppDecoration.lightRoundedBorder,
        child: Padding(
          // size for width
          // there is a parent padding in parent bottom nav with 16 horizontal
          // size - 8*2 - 16*2
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // size - 8*2 - 16*2 - 70
              Image.asset(
                imagePath,
                height: AppSize.s70,
                width: AppSize.s70,
              ),
              // size - 8*2 - 8*2 - 16*2 - 70
              const SizedBox(width: AppMargin.m8),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        // as every image is 25.6 we will subtract 25.6*2
                        // collecting all 8th from the actual size we will reach 9 of 8th
                        // also subtracting 12 as a for Spacing Sized Box
                        width: size.width - 8 * 8 - 25.6 * 2 - 70 - (4 + 8),
                        child: Text(
                          title,
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const AppTextStyles().headingH6,
                        ),
                      ),
                      const SizedBox(width: AppMargin.m4),
                      // Every Icon in the app is 512 square divided by 20 (scale)
                      // then any asset icon is 25.6 square
                      Image.asset(SystemIcons.loveIcon, scale: AppSize.s20),
                      const SizedBox(width: AppMargin.m8),
                      Image.asset(SystemIcons.trashIcon, scale: AppSize.s20)
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '\$$price',
                        style: const AppTextStyles()
                            .headingH6
                            .copyWith(color: AppColors.primaryBlue),
                      ),
                      Container(
                        height: AppSize.s24,
                        decoration: AppDecoration.lightRoundedBorder,
                        child: Row(
                          children: [
                            SizedBox(
                              width: AppSize.s32,
                              child: GestureDetector(
                                onTap: () {},
                                child: Image.asset(SystemIcons.minusIcon,
                                    scale: AppSize.s30),
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s40,
                              child: Container(
                                color: AppColors.neutralLight,
                                child: Center(
                                  child: Text(
                                    '$numberOfItems',
                                    style: const AppTextStyles()
                                        .bodyTextNormalBold
                                        .copyWith(color: AppColors.neutralGrey),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width: AppSize.s32,
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(SystemIcons.plusIcon,
                                        scale: AppSize.s30))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
