import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'numeric_clock.dart';

class SaleAd extends StatelessWidget {
  /// This Widget as responsible for Ad Banners in the App
  /// ADs are types of flash sales and recommendations
  /// Function roles:
  /// this Widget takes the [bgImagePath] image path to put in the background of the Ad
  /// and [widget] as this tree differentiate types of Ad Banners
  /// You need to muse a Widget child to make it work
  /// For now There's two types [SaleAdClock] and [RecommendationTexts]
  /// The [SaleAdClock] takes Seconds and make a Count down timer
  /// the [RecommendationTexts] use two Strings one as title and another as subtitle
  /// Use the widget that suits the case you want
  /// Design roles:
  /// this Widget takes 1/4 of screen height and full width
  ///

  final String bgImagePath;
  final Widget widget;
  const SaleAd({Key? key, required this.bgImagePath, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppCircularRadius.cr5)),
        child: Stack(children: [
          Image.asset(
            bgImagePath,
            fit: BoxFit.fill,
          ),
          SizedBox(height: size.height / AppSize.s4, child: widget)
        ]));
  }
}

class SaleAdClock extends StatefulWidget {
  /// One of children of [SaleAd] Widget
  /// This Widget is a Stateful Widget
  /// takes three parameters
  /// String [saleName] which represent the title of the sale in big font
  /// int [discount] which the percent of Discount that the sale present
  /// int [seconds] which used in count down as that sale has a count down clock
  /// the Widget has two functions
  /// 1.[timeTranslator] which translate the seconds in minutes and hours
  /// 2.[countDownTimer] which SetState takes place here count down decrement take action
  ///

  final int seconds;
  final String saleName;
  final int discount;

  const SaleAdClock({
    Key? key,
    required this.seconds,
    required this.saleName,
    required this.discount,
  }) : super(key: key);

  @override
  State<SaleAdClock> createState() => _SaleAdClockState();
}

int hours = 0;
int minutes = 0;
int remainSeconds = 0;

void timeTranslator(seconds) {
  hours = seconds / (60 * 60) > 1 ? (seconds / (60 * 60)).truncate() : 0;
  minutes = seconds / (60) > 1 ? (seconds / (60) - (60 * hours)).truncate() : 0;
  remainSeconds = seconds - (hours * 60 * 60) - (minutes * 60);
}

class _SaleAdClockState extends State<SaleAdClock> {
  void countDownTimer(seconds) async {
    for (int x = seconds; x > 0; x--) {
      await Future.delayed(const Duration(seconds: 1)).then((_) {
        setState(() {
          if (remainSeconds > 0) {
            remainSeconds--;
          } else if (remainSeconds == 0 && minutes > 0) {
            minutes--;
            remainSeconds = 60;
            remainSeconds--;
          } else if (remainSeconds == 0 && minutes == 0 && hours > 0) {
            hours--;
            minutes = 60;
            minutes--;
            remainSeconds = 60;
            remainSeconds--;
          }
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    timeTranslator(widget.seconds);
    countDownTimer(widget.seconds);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('${widget.saleName} \n${widget.discount}% Off',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              softWrap: true,
              style: const AppTextStyles()
                  .headingH2
                  .copyWith(color: AppColors.backgroundWhite)),
          NumericClock(
            hours: hours.toString(),
            seconds: remainSeconds.toString(),
            minutes: minutes.toString(),
          )
        ],
      ),
    );
  }
}

class RecommendationTexts extends StatelessWidget {
  final String title;
  final String subtitle;
  const RecommendationTexts(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: SizedBox(
        height: size.height / AppSize.s4,
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
