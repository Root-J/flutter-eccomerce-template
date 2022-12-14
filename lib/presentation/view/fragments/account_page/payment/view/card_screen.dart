import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view/card_details.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view_model/card_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/alerts/success_alert.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/items/credit_card_item.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../shared_widgets/bars/nested_app_bar.dart';
import '../../../../shared_widgets/default_button.dart';
import '../../../../shared_widgets/header_padding.dart';

class CardScreen extends StatelessWidget {
  final CardViewModel _cardViewModel = CardViewModel();
  CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _cardViewModel.start();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HeaderPadding(
              widget: NestedAppBar(
            title: AppStrings.creditCardOrDebit,
            backFunction: () => Navigator.pop(context),
          )),
          StreamBuilder(
            stream: _cardViewModel.outputCardViewObject,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Wrap(children: [
                  for (int i = 0; i < snapshot.data!.length; i++)
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, Routes.accountCardDetails,
                          arguments: CardDetailParams(
                              isAdd: false,
                              creditCardModel: snapshot.data![i],
                              index: i)),
                      onLongPress: () => Navigator.pushNamed(
                          context, Routes.confirmationRoute,
                          arguments: DefaultAlertParams(
                              buttonText: AppStrings.delete,
                              message: AppStrings.deleteCardConfirmationMessage,
                              mainFun: () {
                                _cardViewModel.removeCard(i);
                                Navigator.pop(context);
                              })),
                      child: CreditCard(
                          size: size,
                          number: snapshot.data![i].number!,
                          holder: snapshot.data![i].holder!,
                          expireDate: snapshot.data![i].expireDate!),
                    )
                ]);
              } else {
                return const Center(child: Text('You need to put cards'));
              }
            },
          ),
          const SizedBox(height: AppMargin.m76)
        ]),
      ),
      floatingActionButton: DefaultButton(
        width: size.width - AppPadding.p16 * 2,
        title: AppStrings.addCard,
        onTap: () => Navigator.pushNamed(context, Routes.accountCardDetails,
            arguments: const CardDetailParams()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
