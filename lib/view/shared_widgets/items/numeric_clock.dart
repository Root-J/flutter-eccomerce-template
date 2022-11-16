import 'package:flutter/material.dart';

import '../../../constants/const_colors.dart';
import '../../../constants/const_text_styles.dart';

class NumericClock extends StatelessWidget {
  final String seconds;
  final String hours;
  final String minutes;
  const NumericClock({
    Key? key,
    required this.seconds,
    required this.hours,
    required this.minutes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClockNumber(number: hours),
        const SizedBox(width: 8),
        Text(
          ':',
          style: const AppTextStyles()
              .bodyTextLargeBold
              .copyWith(color: AppColors.backgroundWhite),
        ),
        const SizedBox(width: 8),
        ClockNumber(number: minutes),
        const SizedBox(width: 8),
        Text(
          ':',
          style: const AppTextStyles()
              .bodyTextLargeBold
              .copyWith(color: AppColors.backgroundWhite),
        ),
        const SizedBox(width: 8),
        ClockNumber(number: seconds),
      ],
    );
  }
}

class ClockNumber extends StatelessWidget {
  final String number;
  const ClockNumber({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundWhite,
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          number,
          style: const AppTextStyles()
              .headingH4
              .copyWith(color: AppColors.neutralDark),
        ),
      ),
    );
  }
}
