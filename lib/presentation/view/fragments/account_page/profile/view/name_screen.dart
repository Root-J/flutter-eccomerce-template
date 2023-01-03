import 'package:ecommerce_flutter/core/validation/name_validator.dart';
import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/decoration_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/validation/base_validator.dart';
import 'descendants_scaffold.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({Key? key}) : super(key: key);

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late SharedPreferences prefs;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      firstNameController.text = prefs.getString(AppStrings.firstName) ?? '';
      lastNameController.text = prefs.getString(AppStrings.lastName) ?? '';
    });
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDescendantsScaffold(
      title: AppStrings.name,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(AppStrings.firstName,
                style: const AppTextStyles()
                    .headingH5
                    .copyWith(color: AppColors.neutralDark)),
            DataField(
                controller: firstNameController,
                hintText: AppStrings.firstName,
                validator: NameValidator()),
            const SizedBox(height: AppMargin.m8),
            Text(AppStrings.lastName,
                style: const AppTextStyles()
                    .headingH5
                    .copyWith(color: AppColors.neutralDark)),
            DataField(
                controller: lastNameController,
                hintText: AppStrings.lastName,
                validator: NameValidator()),
          ],
        ),
      ),
      fabFun: () {
        if (_formKey.currentState!.validate()) {
          SharedPrefs.save(
              key: AppStrings.firstName, value: firstNameController.text);
          SharedPrefs.save(
              key: AppStrings.lastName, value: lastNameController.text);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.accountProfileRoute, (route) => false);
        }
      },
    );
  }
}

class DataField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final BaseValidator validator;
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
            if (!validator.validate(val)) {
              return validator.getMessage();
            }
            return null;
          }),
    );
  }
}