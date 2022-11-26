import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';

class SeeMoreBar extends StatelessWidget {
  /// This Widget takes all width available
  /// It has two widgets in a Row
  /// One is String [title] which is the name of the widgets Down [SeeMoreBar]
  /// the another one is TextButton in the [SeeMoreBar]
  /// it has an *optional* String [txtButton] ('See More') which the text displayed for TextButton
  /// and [onTap] function which void function mostly it should navigate to another page

  final String title;
  final String txtButton;
  final void Function() onTap;

  const SeeMoreBar({
    Key? key,
    required this.title,
    this.txtButton = AppStrings.seeMore,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
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
