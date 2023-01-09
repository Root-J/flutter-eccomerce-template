import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors_manager.dart';

class Payment extends StatelessWidget {
  final bool isAccount;
  const Payment({Key? key, required this.isAccount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderPadding(widget: NestedAppBar(title: AppStrings.payment)),
          ListTile(
              onTap: () => isAccount
                  ? Navigator.pushNamed(context, Routes.accountCreditCard)
                  : Navigator.pushNamed(context, Routes.cartChooseCardRoute),
              leading: Image.asset(SystemIcons.creditCardIcon,
                  scale: AppSize.s20, color: AppColors.primaryBlue),
              title: Text(AppStrings.creditCardOrDebit,
                  style: const AppTextStyles()
                      .headingH6
                      .copyWith(color: AppColors.neutralDark))),
          ListTile(
              leading: Image.asset(SocialIcons.paypalIcon, scale: AppSize.s20),
              title: Text(AppStrings.paypal,
                  style: const AppTextStyles()
                      .headingH6
                      .copyWith(color: AppColors.neutralDark))),
          ListTile(
              leading: Image.asset(SystemIcons.bankIcon,
                  scale: AppSize.s20, color: AppColors.primaryBlue),
              title: Text(AppStrings.bankTransfer,
                  style: const AppTextStyles()
                      .headingH6
                      .copyWith(color: AppColors.neutralDark))),
        ],
      ),
    );
  }
}

class PaymentParams {
  final bool isAccount;
  const PaymentParams({required this.isAccount});
}
