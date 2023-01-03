import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/descendants_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/routes_manager.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? gender;
  String? selectedValue;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      gender = prefs.getString(AppStrings.gender);
      selectedValue = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ProfileDescendantsScaffold(
        title: AppStrings.gender,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.chooseGender,
              style: const AppTextStyles()
                  .headingH5
                  .copyWith(color: AppColors.neutralDark),
            ),
            const SizedBox(height: AppMargin.m16),
            Container(
              width: size.width - 16,
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutralLight),
                  borderRadius: BorderRadius.circular(AppCircularRadius.cr5)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(
                    AppStrings.gender,
                    style: const AppTextStyles()
                        .formTextFill
                        .copyWith(color: AppColors.neutralGrey),
                  ),
                  borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
                  value: selectedValue,
                  onChanged: (String? newValue) =>
                      setState(() => selectedValue = newValue),
                  items: [AppStrings.male, AppStrings.female]
                      .map<DropdownMenuItem<String>>(
                          (String value) => DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const AppTextStyles()
                                      .formTextFill
                                      .copyWith(
                                          color: value == selectedValue
                                              ? AppColors.primaryBlue
                                              : AppColors.neutralGrey),
                                ),
                              ))
                      .toList(),
                  icon: Image.asset(
                    SystemIcons.bottomArrowIcon,
                    scale: AppSize.s24,
                  ),
                  underline: const SizedBox(),
                ),
              ),
            )
          ],
        ),
        fabFun: () {
          if (selectedValue != gender) {
            SharedPrefs.save(key: AppStrings.gender, value: selectedValue);
          }
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.accountProfileRoute, (route) => false);
        });
  }
}
