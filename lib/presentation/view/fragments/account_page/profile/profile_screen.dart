import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../../../resources/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderPadding(
                widget: NestedAppBar(title: AppStrings.profile)),

            // Profile Name and Photo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const CircleAvatar(
                  radius: AppSize.s40,
                  child: Icon(Icons.person),
                ),
                const SizedBox(width: AppMargin.m16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thomas Meshail',
                      style: const AppTextStyles()
                          .headingH5
                          .copyWith(color: AppColors.neutralDark),
                    ),
                    Text(
                      '@2Math0',
                      style: const AppTextStyles()
                          .bodyTextNormalRegular
                          .copyWith(color: AppColors.neutralGrey),
                    ),
                  ],
                ),
              ]),
            ),

            const SizedBox(height: AppMargin.m24),

            // Profile Details
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileTiles(
                    imagePath: SystemIcons.genderIcon,
                    title: AppStrings.gender,
                    trailing: AppStrings.male,
                    onTap: () {}),
                ProfileTiles(
                    imagePath: SystemIcons.dateIcon,
                    title: AutofillHints.birthdayDay,
                    trailing: '20-4-2000',
                    onTap: () {}),
                ProfileTiles(
                    imagePath: SystemIcons.emailIcon,
                    title: AppStrings.email,
                    trailing: 'thomas.meshail@gmail.com',
                    onTap: () {}),
                ProfileTiles(
                    imagePath: SystemIcons.phoneIcon,
                    title: AppStrings.phoneNumber,
                    trailing: '(+20) 1206207320',
                    onTap: () {}),
                ProfileTiles(
                    imagePath: SystemIcons.passwordIcon,
                    isPassword: true,
                    title: AppStrings.changePassword,
                    trailing: 'this is password',
                    onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  final String imagePath;
  final String title;
  final String trailing;
  final void Function() onTap;
  final bool isPassword;

  const ProfileTiles({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.trailing,
    required this.onTap,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Image.asset(imagePath,
          scale: AppSize.s20, color: AppColors.primaryBlue),
      title: Text(
        title,
        style: const AppTextStyles()
            .headingH6
            .copyWith(color: AppColors.neutralDark),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isPassword ? trailing.replaceAll(RegExp(r"."), "•") : trailing,
            style: const AppTextStyles().bodyTextNormalRegular.copyWith(
                  color: AppColors.neutralGrey,
                ),
          ),
          Image.asset(SystemIcons.forwardIcon, scale: AppSize.s24),
        ],
      ),
    );
  }
}
