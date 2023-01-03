import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../../resources/text_styles_manager.dart';
import '../../resources/values_manager.dart';

class DefaultButton extends StatelessWidget {
  final double width;
  final String title;
  final void Function() onTap;

  const DefaultButton({
    Key? key,
    required this.title,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s60,
      width: width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue24Opacity, //color of shadow
            spreadRadius: 0, //spread radius
            blurRadius: 30, // blur radius
            offset: Offset(0, 10), // changes position of shadow
            //first parameter of offset is left-right
            //second parameter is top to down
          ),
          //you can set more BoxShadow() here
        ],
      ),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppCircularRadius.cr5)),
              backgroundColor: AppColors.primaryBlue,
              fixedSize: Size(width, AppSize.s60),
              elevation: 0
              // shadowColor: AppColors.primaryBlue24Opacity,
              // elevation: 10,
              ),
          child: Text(
            title,
            style: const AppTextStyles()
                .buttonText
                .copyWith(color: AppColors.backgroundWhite),
          )),
    );
  }
}
