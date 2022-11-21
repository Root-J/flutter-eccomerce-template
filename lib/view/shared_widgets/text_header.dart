import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';
import '../../constants/const_text_styles.dart';

class TextHeader extends StatelessWidget {
  const TextHeader({
    Key? key,
    required this.text,
    this.color = AppColors.neutralDark,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const AppTextStyles().headingH4.copyWith(color: color),
    );
  }
}
