import 'dart:developer';

import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/view_model/address_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/default_button.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../cart_page/view/ship_to.dart';

// The design of this page is the exact of PickAddress Screen in Cart Page
class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
          const HeaderPadding(widget: NestedAppBar(title: AppStrings.address)),
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
                return const Center(child: Text('You need to put address'));
              }
            },
          ),
        ]),
      ),
      floatingActionButton: DefaultButton(
        width: size.width - AppPadding.p16 * 2,
        title: AppStrings.addAddress,
        onTap: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
