import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view_model/profile_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/parent_nav/parent_bottom_nav_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/assets_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileViewModel _viewModel = ProfileViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.start();
  }

  Future<void> initial() async {}

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
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
                        // to get back to Account Fragment after getting back from pushAndRemoveUntil from any other screen
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
                StreamBuilder(
                    initialData: _viewModel.model,
                    stream: _viewModel.outputProfileViewObject,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, Routes.accountNameRoute),
                                child: Text(
                                  '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                                  style: const AppTextStyles()
                                      .headingH5
                                      .copyWith(color: AppColors.neutralDark),
                                )),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppPadding.p8),
                                child: Text(
                                  snapshot.data!.userName ?? '',
                                  style: const AppTextStyles()
                                      .bodyTextNormalRegular
                                      .copyWith(color: AppColors.neutralGrey),
                                ))
                          ],
                        );
                      } else {
                        return const Center(child: Text('Wait'));
                      }
                    }),
              ]),
            ),

            const SizedBox(height: AppMargin.m24),

            // Profile Details
            Column(mainAxisSize: MainAxisSize.min, children: [
              ProfileTiles(
                  imagePath: SystemIcons.genderIcon,
                  title: AppStrings.gender,
                  trailing: _viewModel.gender ?? '',
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.accountGenderRoute)),
              ProfileTiles(
                  imagePath: SystemIcons.dateIcon,
                  title: AppStrings.birthday,
                  trailing: _viewModel.birthday ?? '',
                  onTap: () => Navigator.pushNamed(
                      context, Routes.accountBirthdayRoute)),
              ProfileTiles(
                  imagePath: SystemIcons.emailIcon,
                  title: AppStrings.email,
                  trailing: _viewModel.email ?? '',
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.accountEmailRoute)),
              ProfileTiles(
                  imagePath: SystemIcons.phoneIcon,
                  title: AppStrings.phoneNumber,
                  trailing: _viewModel.phoneNumber ?? '',
                  onTap: () => Navigator.pushNamed(
                      context, Routes.accountPhoneNumberRoute)),
              ProfileTiles(
                  imagePath: SystemIcons.passwordIcon,
                  isPassword: true,
                  title: AppStrings.changePassword,
                  trailing: _viewModel.password ?? '',
                  onTap: () => Navigator.pushNamed(
                      context, Routes.accountChangePassword))
            ])
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
