import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/parent_nav/parent_bottom_nav_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../resources/assets_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? firstName;
  String? lastName;
  String? userName;
  String? gender;
  String? birthday;
  String? email;
  String? phoneNumber;
  String? password;
  late SharedPreferences prefs;
  void initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      firstName = prefs.getString(AppStrings.firstName);
      lastName = prefs.getString(AppStrings.lastName);
      userName = prefs.getString(AppStrings.userName);
      gender = prefs.getString(AppStrings.gender);
      birthday = prefs.getString(AppStrings.birthday);
      email = prefs.getString(AppStrings.email);
      phoneNumber = prefs.getString(AppStrings.phoneNumber);
      password = prefs.getString(AppStrings.password);
    });
  }

  @override
  void initState() {
    super.initState();
    initial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderPadding(
                widget: NestedAppBar(
                    title: AppStrings.profile,
                    backFunction: () => Navigator.pushNamedAndRemoveUntil(
                        context, Routes.marketRoute, (route) => false,
                        arguments: const ParentIndexParams(intIndex: 4)))),

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.accountNameRoute),
                      child: Text(
                        '$firstName $lastName',
                        style: const AppTextStyles()
                            .headingH5
                            .copyWith(color: AppColors.neutralDark),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: Text(
                        userName ?? '',
                        style: const AppTextStyles()
                            .bodyTextNormalRegular
                            .copyWith(color: AppColors.neutralGrey),
                      ),
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
                    trailing: gender ?? '',
                    onTap: () => Navigator.pushNamed(
                        context, Routes.accountGenderRoute)),
                ProfileTiles(
                    imagePath: SystemIcons.dateIcon,
                    title: AutofillHints.birthdayDay,
                    trailing: birthday ?? '',
                    onTap: () {}),
                ProfileTiles(
                    imagePath: SystemIcons.emailIcon,
                    title: AppStrings.email,
                    trailing: email ?? '',
                    onTap: () {}),
                ProfileTiles(
                    imagePath: SystemIcons.phoneIcon,
                    title: AppStrings.phoneNumber,
                    trailing: phoneNumber ?? '',
                    onTap: () {}),
                ProfileTiles(
                    imagePath: SystemIcons.passwordIcon,
                    isPassword: true,
                    title: AppStrings.changePassword,
                    trailing: password ?? '',
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
