import 'package:country_list_pick/country_list_pick.dart';
import 'package:ecommerce_flutter/core/validation/base_validator.dart';
import 'package:ecommerce_flutter/core/validation/name_validator.dart';
import 'package:ecommerce_flutter/core/validation/number_validator.dart';
import 'package:ecommerce_flutter/core/validation/optional_validation.dart';
import 'package:ecommerce_flutter/core/validation/phone_validator.dart';
import 'package:ecommerce_flutter/core/validation/required_validator.dart';
import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/address/view_model/add_address_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/name_screen.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/default_button.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/decoration_manager.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final AddAddressViewModel _addAddressViewModel = AddAddressViewModel();

  @override
  void initState() {
    super.initState();
    _addAddressViewModel.start();
  }

  @override
  void dispose() {
    _addAddressViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderPadding(
                widget: NestedAppBar(title: AppStrings.addAddress)),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
                child: Text(AppStrings.countryOrRegion,
                    style: const AppTextStyles()
                        .headingH5
                        .copyWith(color: AppColors.neutralDark))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              child: CountryListPick(
                  appBar: AppBar(
                    backgroundColor: AppColors.neutralDark,
                    title: Text(
                      'Pick Country',
                      style: const AppTextStyles().headingH5,
                    ),
                  ),
                  // if you need custom picker use this
                  pickerBuilder: (context, CountryCode? countryCode) =>
                      Container(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        decoration: AppDecoration.lightRoundedBorder,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              countryCode!.name!,
                              style: const AppTextStyles()
                                  .formTextFill
                                  .copyWith(color: AppColors.neutralGrey),
                            ),
                            Image.asset(
                              SystemIcons.bottomArrowIcon,
                              scale: AppSize.s24,
                            ),
                          ],
                        ),
                      ),

                  // To disable option set to false
                  theme: CountryTheme(
                      isShowFlag: false,
                      isShowTitle: true,
                      isShowCode: false,
                      isDownIcon: false,
                      showEnglishName: true,
                      labelColor: AppColors.neutralGrey,
                      alphabetTextColor: AppColors.neutralDark,
                      alphabetSelectedBackgroundColor: AppColors.neutralDark),
                  // Set default value
                  // initialSelection: '+62',
                  // or
                  // initialSelection: 'US'
                  onChanged: (CountryCode? code) {
                    setState(() {
                      _addAddressViewModel.countryValue = code!.name;
                      _addAddressViewModel.countryCode = code.code;
                    });
                  },
                  // Whether to allow the widget to set a custom UI overlay
                  useUiOverlay: true,
                  // Whether the country list should be wrapped in a SafeArea
                  useSafeArea: true),
            ),
            if (_addAddressViewModel.countryValue!.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: Text(
                  " * Country is Required",
                  style: const AppTextStyles()
                      .bodyTextNormalBold
                      .copyWith(color: AppColors.primaryRed),
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
              child: Form(
                key: _addAddressViewModel.formKey,
                child: Column(
                  children: [
                    FieldWithTitle(
                        controller: _addAddressViewModel.firstNameController,
                        title: AppStrings.firstName,
                        validator: NameValidator()),
                    FieldWithTitle(
                        controller: _addAddressViewModel.lastNameController,
                        title: AppStrings.lastName,
                        validator: NameValidator()),
                    FieldWithTitle(
                        controller:
                            _addAddressViewModel.streetAddressController,
                        title: AppStrings.streetAddress,
                        validator: RequiredValidator()),
                    FieldWithTitle(
                        controller:
                            _addAddressViewModel.secondStreetAddressController,
                        title: AppStrings.secondStreetAddress,
                        validator: OptionalValidator()),
                    FieldWithTitle(
                        controller: _addAddressViewModel.stateController,
                        title: AppStrings.state,
                        validator: NameValidator()),
                    FieldWithTitle(
                        controller: _addAddressViewModel.zipCodeController,
                        title: AppStrings.zipCode,
                        validator: NumberValidator()),
                    FieldWithTitle(
                        controller: _addAddressViewModel.phoneNumberController,
                        title: AppStrings.phoneNumber,
                        validator: PhoneValidator()),
                  ],
                ),
              ),
            ),
            Center(
              child: DefaultButton(
                  title: AppStrings.addAddress,
                  width: size.width - 16 * 2,
                  onTap: () {
                    if (_addAddressViewModel.formKey.currentState!.validate() &&
                        _addAddressViewModel.countryValue!.isNotEmpty) {
                      _addAddressViewModel.addAddressToData();
                      Navigator.pushReplacementNamed(
                          context, Routes.accountAddressRoute);
                    }
                  }),
            ),
            const SizedBox(height: AppMargin.m16),

            ///print newly selected country state and city in Text Widget
          ],
        ),
      ),
    );
  }
}

class FieldWithTitle extends StatelessWidget {
  const FieldWithTitle({
    Key? key,
    required this.controller,
    required this.title,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final BaseValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: AppMargin.m8),
      Text(title,
          style: const AppTextStyles()
              .headingH5
              .copyWith(color: AppColors.neutralDark)),
      DataField(controller: controller, hintText: title, validator: validator),
      const SizedBox(height: AppMargin.m4),
    ]);
  }
}
