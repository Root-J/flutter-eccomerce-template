import 'dart:developer';

import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/decoration_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/view_model/address_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/default_button.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

class PickAddress extends StatefulWidget {
  const PickAddress({Key? key}) : super(key: key);

  @override
  State<PickAddress> createState() => _PickAddressState();
}

class _PickAddressState extends State<PickAddress> {
  final AddressViewModel _addressViewModel = AddressViewModel();

  @override
  void initState() {
    super.initState();
    _addressViewModel.start();
  }

  @override
  void dispose() {
    super.dispose();
    _addressViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const HeaderPadding(
              widget: NestedAppBar(
            title: AppStrings.shipTo,
            isAdd: true,
            /* onAddTapped: navigate to add new Address page, */
          )),
          StreamBuilder(
            stream: _addressViewModel.outputAddressViewObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                log(snapshot.data!.toString());
                return Wrap(children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                    GestureDetector(
                      onTap: () {
                        if (snapshot.data![i].isDefault == false) {
                          _addressViewModel.selectAddress(i);
                        }
                      },
                      child: AddressItem(
                        town: snapshot.data![i].town!,
                        addressDetails: snapshot.data![i].addressDetails!,
                        phone: snapshot.data![i].phone!,
                        isSelected: snapshot.data![i].isDefault!,
                      ),
                    )
                ]);
              } else {
                return const Center(child: Text('you need to put address'));
              }
            },
          ),
        ]),
      ),
      floatingActionButton: DefaultButton(
          width: size.width - AppPadding.p16 * 2,
          title: AppStrings.next,
          onTap: () => Navigator.pushNamed(context, Routes.cartPaymentRoute)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AddressItem extends StatelessWidget {
  final String town;
  final String addressDetails;
  final String phone;
  final bool isSelected;
  const AddressItem({
    Key? key,
    required this.town,
    required this.addressDetails,
    required this.phone,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: GestureDetector(
        // onTap: () => setState(() => isTapped = !isTapped),
        child: Container(
          decoration: isSelected
              ? AppDecoration.lightRoundedBorder
                  .copyWith(border: Border.all(color: AppColors.primaryBlue))
              : AppDecoration.lightRoundedBorder,
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(town,
                  style: const AppTextStyles()
                      .headingH5
                      .copyWith(color: AppColors.neutralDark)),
              const SizedBox(height: AppMargin.m16),
              Text(
                addressDetails,
                style: const AppTextStyles()
                    .bodyTextNormalRegular
                    .copyWith(color: AppColors.neutralGrey),
              ),
              const SizedBox(height: AppMargin.m16),
              Text(
                phone,
                style: const AppTextStyles()
                    .bodyTextNormalRegular
                    .copyWith(color: AppColors.neutralGrey),
              ),
              const SizedBox(height: AppMargin.m12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  DefaultButton(
                      title: AppStrings.edit, width: AppSize.s80, onTap: () {}),
                  const SizedBox(width: AppMargin.m24),
                  Image.asset(
                    SystemIcons.trashIcon,
                    scale: AppSize.s20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
