import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/decoration_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/descendants_scaffold.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view_model/gender_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/assets_manager.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({Key? key}) : super(key: key);

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  final GenderViewModel _viewModel = GenderViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.start();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDescendantsScaffold(
        title: AppStrings.gender,
        child: StreamBuilder(
          stream: _viewModel.outputGenderViewObject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return genderScreenUI(snapshot.data!);
            } else {
              return const Center(
                  child:
                      CircularProgressIndicator(color: AppColors.primaryBlue));
            }
          },
        ),
        fabFun: () => _viewModel.saveButton(context));
  }

  Column genderScreenUI(GenderModel data) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
          decoration: AppDecoration.defaultBoxDecoration,
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
              value: data.gender,
              onChanged: (selection) => _viewModel.onChange(selection!),
              items: [AppStrings.male, AppStrings.female]
                  .map<DropdownMenuItem<String>>(
                      (String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const AppTextStyles().formTextFill.copyWith(
                                color: value == data.gender
                                    ? AppColors.primaryBlue
                                    : AppColors.neutralGrey),
                          )))
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
    );
  }
}
