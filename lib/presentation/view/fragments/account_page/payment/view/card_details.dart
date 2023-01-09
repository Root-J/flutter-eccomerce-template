import 'package:ecommerce_flutter/core/validation/credit_card_validation/card_holder_validation.dart';
import 'package:ecommerce_flutter/core/validation/credit_card_validation/card_number_validation.dart';
import 'package:ecommerce_flutter/core/validation/credit_card_validation/expiration_date_validation.dart';
import 'package:ecommerce_flutter/core/validation/credit_card_validation/security_code_validation.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/address/view/add_address_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view_model/card_details_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/default_button.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({Key? key}) : super(key: key);

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  final CardDetailsViewModel _cardDetailsViewModel = CardDetailsViewModel();

  @override
  void initState() {
    _cardDetailsViewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _cardDetailsViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderPadding(
                  widget: NestedAppBar(
                      title: AppStrings.addCard,
                      backFunction: () => Navigator.pop(context))),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Form(
                    key: _cardDetailsViewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FieldWithTitle(
                            controller:
                                _cardDetailsViewModel.cardNumberController,
                            validator: CardNumberValidation(),
                            title: AppStrings.cardNumber),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FieldWithTitle(
                                controller: _cardDetailsViewModel
                                    .expirationDateController,
                                title: AppStrings.expirationDate,
                                validator: ExpirationDateValidation(),
                                isTwo: true),
                            FieldWithTitle(
                                controller: _cardDetailsViewModel
                                    .securityCodeController,
                                title: AppStrings.securityCode,
                                validator: SecurityCodeValidation(),
                                isTwo: true),
                          ],
                        ),
                        FieldWithTitle(
                            controller:
                                _cardDetailsViewModel.cardHolderController,
                            validator: CardHolderValidation(),
                            title: AppStrings.cardHolder),
                        const SizedBox(height: AppSize.s80),
                      ],
                    )),
              )
            ],
          ),
        ),
        floatingActionButton: DefaultButton(
            width: size.width - AppPadding.p16 * 2,
            title: AppStrings.addCard,
            onTap: () {
              if (_cardDetailsViewModel.formKey.currentState!.validate()) {
                _cardDetailsViewModel.addCardDetailsToData();
                Navigator.pop(context);
              }
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
