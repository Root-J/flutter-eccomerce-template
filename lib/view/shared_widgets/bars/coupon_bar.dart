import 'package:ecommerce_flutter/constants/const_colors.dart';
import 'package:flutter/material.dart';

import '../../../constants/const_text_styles.dart';

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
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(message,
            style: const AppTextStyles().headingH4.copyWith(color: textColor)),
      ),
    );
  }
}
