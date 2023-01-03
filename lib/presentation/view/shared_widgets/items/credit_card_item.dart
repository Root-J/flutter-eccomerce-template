import 'dart:math';

import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';
import '../master_card_logo.dart';

class CreditCard extends StatelessWidget {
  final String number;
  final String holder;
  final String expireDate;
  const CreditCard({
    Key? key,
    required this.size,
    required this.number,
    required this.holder,
    required this.expireDate,
  }) : super(key: key);

  final Size size;

  Color randomBGGenerator() {
    Random rand = Random();
    List<Color> primaryColors = [
      AppColors.primaryBlue,
      AppColors.primaryRed,
      AppColors.primaryGreen,
      AppColors.primaryPurple,
      AppColors.primaryYellow
    ];
    return primaryColors[rand.nextInt(primaryColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Container(
        width: size.width,
        height: 190,
        padding: const EdgeInsets.all(AppPadding.p24),
        decoration: BoxDecoration(
          color: randomBGGenerator(),
          borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const MasterCardLogo(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < 4; i++)
                  Text(
                    number.substring(i, i + 4),
                    style: const AppTextStyles()
                        .headingH2
                        .copyWith(color: AppColors.backgroundWhite),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      AppStrings.cardHolder.toUpperCase(),
                      style: const AppTextStyles()
                          .captionNormalRegular
                          .copyWith(
                              color: AppColors.backgroundWhite
                                  .withOpacity(AppSize.s60 / 100)),
                    ),
                    Text(
                      'Lailyfa Febrina',
                      style: const AppTextStyles()
                          .captionNormalBold
                          .copyWith(color: AppColors.backgroundWhite),
                    )
                  ],
                ),
                const SizedBox(width: AppMargin.m20),
                Column(
                  children: [
                    Text(
                      AppStrings.cardExpire.toUpperCase(),
                      style: const AppTextStyles()
                          .captionNormalRegular
                          .copyWith(
                              color: AppColors.backgroundWhite
                                  .withOpacity(AppSize.s60 / 100)),
                    ),
                    Text(
                      '19/2042',
                      style: const AppTextStyles()
                          .captionNormalBold
                          .copyWith(color: AppColors.backgroundWhite),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
