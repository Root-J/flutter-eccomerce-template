import 'dart:developer';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/validation/name_validator.dart';
import '../../../../../../core/validation/number_validator.dart';
import '../../../../../../core/validation/optional_validation.dart';
import '../../../../../../core/validation/phone_validator.dart';
import '../../../../../../core/validation/required_validator.dart';
import '../../../../../../domain/models/cart_models/address_model.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/decoration_manager.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/text_styles_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../shared_widgets/bars/nested_app_bar.dart';
import '../../../../shared_widgets/default_button.dart';
import '../../../../shared_widgets/header_padding.dart';
import '../view_model/add_address_view_model.dart';
import 'add_address_screen.dart';

class EditAddressScreen extends StatefulWidget {
  final AddressModel addressModel;
  final int index;
  const EditAddressScreen(
      {Key? key, required this.addressModel, required this.index})
      : super(key: key);

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final AddAddressViewModel _addAddressViewModel = AddAddressViewModel();

  @override
  void initState() {
    super.initState();
    _addAddressViewModel.start();
    _addAddressViewModel.getAddressFromIndex(widget.addressModel);
  }

  @override
  void dispose() {
    _addAddressViewModel.dispose();
    super.dispose();
  }

  // ToDo : when calling country by user's region as initial value the Edit and Add Address screens should be one class with (title, buttonName, buttonFun, addressModel(for edit)) arguments
  // Also there is another approach by making a boolean to switch between edit and add states therefore the args would be (booleanSwitcher, AddressModel?) only

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderPadding(
                widget: NestedAppBar(title: AppStrings.editAddress)),
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
                      initialSelection: _addAddressViewModel.countryCode,
                      alphabetSelectedBackgroundColor: AppColors.neutralDark),
                  // Set default value
                  // initialSelection: '+62',
                  // or
                  initialSelection: _addAddressViewModel.countryCode,
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
                  title: AppStrings.saveAddress,
                  width: size.width - 16 * 2,
                  onTap: () {
                    if (_addAddressViewModel.formKey.currentState!.validate() &&
                        _addAddressViewModel.countryValue!.isNotEmpty) {
                      _addAddressViewModel.updateAddress(index: widget.index);
                      Navigator.pushReplacementNamed(
                          context, Routes.accountAddressRoute);
                    } else {
                      log("error happened");
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

class EditAddressScreenParams {
  final AddressModel addressModel;
  final int index;
  const EditAddressScreenParams(this.addressModel, this.index);
}
