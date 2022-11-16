import 'package:flutter/material.dart';

import '../../../constants/const_colors.dart';
import '../../../constants/const_text_styles.dart';

class SeeMoreBar extends StatelessWidget {
  final String title;
  final String txtButton;
  final void Function() onTap;

  const SeeMoreBar({
    Key? key,
    required this.title,
    this.txtButton = 'See More',
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const AppTextStyles()
              .bodyTextMediumBold
              .copyWith(color: AppColors.neutralDark),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            txtButton,
            style: const AppTextStyles()
                .bodyTextMediumBold
                .copyWith(color: AppColors.primaryBlue),
          ),
        )
      ],
    );
  }
}
