import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/text_header.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderPadding(widget: TextHeader(text: AppStrings.account)),
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            AccountItem(
                imagePath: SystemIcons.userIcon,
                txt: AppStrings.profile,
                onTap: () =>
                    Navigator.pushNamed(context, Routes.accountProfileRoute)),
            AccountItem(
                imagePath: SystemIcons.bagIcon,
                txt: AppStrings.order,
                onTap: () {}),
            AccountItem(
                imagePath: SystemIcons.locationIcon,
                txt: AppStrings.address,
                onTap: () =>
                    Navigator.pushNamed(context, Routes.accountAddressRoute)),
            AccountItem(
                imagePath: SystemIcons.creditCardIcon,
                txt: AppStrings.payment,
                onTap: () async {}),
            AccountItem(
                imagePath: SystemIcons.userIcon,
                txt: AppStrings.tempData,
                onTap: () => SharedPrefs().addDateTemp()),
          ]),
        )
      ],
    );
  }
}

class AccountItem extends StatelessWidget {
  final String imagePath;
  final String txt;
  final void Function() onTap;

  const AccountItem(
      {Key? key,
      required this.imagePath,
      required this.txt,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: Image.asset(
          imagePath,
          scale: AppSize.s20,
          color: AppColors.primaryBlue,
        ),
        title: Text(
          txt,
          style: const AppTextStyles()
              .headingH6
              .copyWith(color: AppColors.neutralDark),
        ));
  }
}
