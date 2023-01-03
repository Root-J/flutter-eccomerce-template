import 'dart:developer';

import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/decoration_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/descendants_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/validation/phone_validator.dart';
import '../../../../../data/profile_data/account_data.dart';
import '../../../../resources/routes_manager.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  String? phoneNumber;
  late SharedPreferences prefs;
  PhoneNumber? number;

  TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String initialCountry = 'NG';

  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    prefs = await SharedPreferences.getInstance();
    phoneNumber = prefs.getString(AppStrings.phoneNumber);
    number = phoneNumber != null
        ? await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber!)
        : null;
    phoneNumberController.text = number!.phoneNumber!;
    log(number.toString());
  }

  @override
  void dispose() {
    super.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDescendantsScaffold(
        title: AppStrings.phoneNumber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.phoneNumber,
                style: const AppTextStyles()
                    .headingH5
                    .copyWith(color: AppColors.neutralDark)),
            const SizedBox(height: AppMargin.m8),
            Form(
              key: _formKey,
              child: InternationalPhoneNumberInput(
                inputDecoration:
                    AppDecoration.formFieldDecoration(AppStrings.phoneNumber)
                        .copyWith(
                  prefixIcon: Image.asset(
                    SystemIcons.phoneIcon,
                    scale: AppSize.s24,
                    color: AppColors.primaryBlue,
                  ),
                ),
                onInputChanged: (PhoneNumber n) {
                  number = n;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                textStyle: const AppTextStyles()
                    .formTextFill
                    .copyWith(color: AppColors.neutralGrey),
                initialValue: number,
                validator: (val) {
                  if (!PhoneValidator().validate(val)) {
                    return PhoneValidator().getMessage();
                  }
                  return null;
                },
                selectorTextStyle: const AppTextStyles()
                    .formTextFill
                    .copyWith(color: AppColors.neutralGrey),
                textFieldController: phoneNumberController,
                formatInput: false,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: const OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  log('On Saved: $number');
                },
              ),
            ),
          ],
        ),
        fabFun: () {
          _formKey.currentState?.save();
          if (_formKey.currentState!.validate() &&
              phoneNumber != phoneNumberController.text) {
            SharedPrefs.save(
                key: AppStrings.phoneNumber,
                value: number?.phoneNumber.toString());
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.accountProfileRoute, (route) => false);
          }
        });
  }
}