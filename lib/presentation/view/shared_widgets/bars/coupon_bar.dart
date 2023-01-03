import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';

class CouponBar extends StatelessWidget {
  /// Bar item that contains a text and background color
  /// [message] the message we need to show because it made for coupons but it can be use for any type of messages
  /// optional [bgColor] (blue) the color of background it could be changed to red if it was error message
  /// optional [textColor] (white) the color of text that matches the background to make the text readable
  ///
  const CouponBar({
    Key? key,
    required this.message,
    this.bgColor = AppColors.primaryBlue,
    this.textColor = AppColors.backgroundWhite,
  }) : super(key: key);
  final String message;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p24),
        child: Text(message,
            style: const AppTextStyles().headingH4.copyWith(color: textColor)),
      ),
    );
  }
}
