import 'package:flutter/material.dart';

import '../../../constants/const_colors.dart';
import '../../../constants/const_text_styles.dart';
import 'numeric_clock.dart';

class SaleAdClock extends StatelessWidget {
  final String seconds;
  final String hours;
  final String minutes;
  final String saleName;
  final int discount;

  const SaleAdClock({
    Key? key,
    required this.seconds,
    required this.hours,
    required this.minutes,
    required this.saleName,
    required this.discount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$saleName $discount% Off',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              softWrap: true,
              style: const AppTextStyles()
                  .headingH2
                  .copyWith(color: AppColors.backgroundWhite)),
          NumericClock(
            hours: hours,
            seconds: seconds,
            minutes: minutes,
          )
        ],
      ),
    );
  }
}

class SaleAd extends StatelessWidget {
  final String bgImagePath;
  final Widget widget;
  const SaleAd({Key? key, required this.bgImagePath, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        child: Stack(children: [
          Image.asset(
            bgImagePath,
            fit: BoxFit.fill,
          ),
          widget
        ]));
  }
}

class RecommendationTexts extends StatelessWidget {
  final String title;
  final String subtitle;
  final Size size;
  const RecommendationTexts(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: size.height / 4,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  softWrap: true,
                  style: const AppTextStyles()
                      .headingH2
                      .copyWith(color: AppColors.backgroundWhite)),
              Text(subtitle,
                  maxLines: 5,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const AppTextStyles()
                      .bodyTextNormalRegular
                      .copyWith(color: AppColors.backgroundWhite))
            ]),
      ),
    );
  }
}
