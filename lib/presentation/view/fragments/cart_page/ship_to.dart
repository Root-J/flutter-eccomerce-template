import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/decoration_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
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
  final List<Map<String, dynamic>> addressList = [
    {
      'address town': 'Priscekila',
      'address details':
          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
      'phone': '+99 1234567890',
      'isDefault': true,
    },
    {
      'address town': 'Priscekila',
      'address details':
          '3711 Spring Hill Rd undefined Tallahassee, Nevada 52874 United States',
      'phone': '+99 1234567890',
      'isDefault': false,
    },
  ];

  void _selectAddress(int selectedI) {
    // assign selected Address
    addressList[selectedI]['isDefault'] = true;

    // make other addresses unavailable
    for (int i = 0; i < addressList.length; i++) {
      if (i != selectedI) {
        addressList[i]['isDefault'] = false;
      }
    }
    setState(() {});
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
                widget: NestedAppBar(
              title: AppStrings.shipTo,
              isAdd: true,
              /* onAddTapped: navigate to add new Address page, */
            )),
            Wrap(
              children: [
                for (int i = 0; i < addressList.length; i++)
                  GestureDetector(
                    onTap: () {
                      if (addressList[i]['isDefault'] == false) {
                        _selectAddress(i);
                      }
                    },
                    child: AddressItem(
                      town: addressList[i]['address town'],
                      addressDetails: addressList[i]['address details'],
                      phone: addressList[i]['phone'],
                      isSelected: addressList[i]['isDefault'],
                    ),
                  )
              ],
            )
          ],
        ),
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
