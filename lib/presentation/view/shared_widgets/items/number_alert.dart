import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:flutter/material.dart';

class NumberAlert extends StatelessWidget {
  final int number;
  const NumberAlert({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: AppColors.primaryRed,
      child: Text(
        '$number',
        style: const AppTextStyles()
            .linkSmall
            .copyWith(color: AppColors.backgroundWhite),
      ),
    );
  }
}
