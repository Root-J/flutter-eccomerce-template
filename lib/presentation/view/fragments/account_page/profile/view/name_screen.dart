import 'package:ecommerce_flutter/core/validation/name_validator.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/decoration_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view_model/name_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/validation/base_validator.dart';
import 'descendants_scaffold.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final NameViewModel _viewModel = NameViewModel();

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
      title: AppStrings.name,
      child: Form(
        key: _viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppStrings.firstName,
                style: const AppTextStyles()
                    .headingH5
                    .copyWith(color: AppColors.neutralDark)),
            DataField(
                controller: _viewModel.firstNameController,
                hintText: AppStrings.firstName,
                validator: NameValidator()),
            const SizedBox(height: AppMargin.m8),
            Text(AppStrings.lastName,
                style: const AppTextStyles()
                    .headingH5
                    .copyWith(color: AppColors.neutralDark)),
            DataField(
                controller: _viewModel.lastNameController,
                hintText: AppStrings.lastName,
                validator: NameValidator()),
          ],
        ),
      ),
      fabFun: () => _viewModel.saveButton(context),
    );
  }
}

class DataField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final BaseValidator? validator;
  const DataField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: TextFormField(
          style: const AppTextStyles()
              .formTextFill
              .copyWith(color: AppColors.neutralGrey),
          decoration: AppDecoration.formFieldDecoration(hintText),
          controller: controller,
          validator: (val) {
            if (validator == null) {
              return null;
            } else if (!validator!.validate(val)) {
              return validator!.getMessage();
            }
            return null;
          }),
    );
  }
}
