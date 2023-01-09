import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/default_button.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  final String buttonText;
  final String message;
  final void Function() mainFun;
  const SuccessScreen(
      {Key? key,
      required this.buttonText,
      required this.message,
      required this.mainFun})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              fit: BoxFit.fill,
              AlertIcons.successIcon,
              scale: AppSize.s4,
            ),
            Text(
              AppStrings.success,
              style: const AppTextStyles()
                  .headingH2
                  .copyWith(color: AppColors.neutralDark),
            ),
            const SizedBox(height: AppMargin.m12),
            Text(
              message,
              style: const AppTextStyles()
                  .bodyTextNormalRegular
                  .copyWith(color: AppColors.neutralDark),
            ),
            const SizedBox(height: AppMargin.m12),
            DefaultButton(
                title: buttonText,
                width: size.width - AppPadding.p16 * 2,
                onTap: mainFun)
          ],
        ),
      ),
    );
  }
}

class DefaultAlertParams {
  ///
  /// in main function you should add the main method to run and you may add Navigator.pop(context);
  ///
  final String buttonText;
  final String message;
  final void Function() mainFun;
  const DefaultAlertParams({
    required this.buttonText,
    required this.message,
    required this.mainFun,
  });
}
