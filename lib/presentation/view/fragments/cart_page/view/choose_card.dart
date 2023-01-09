import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view/card_details.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view_model/card_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/alerts/success_alert.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/default_button.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/slide_show.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors_manager.dart';
import '../../../shared_widgets/items/credit_card_item.dart';

class ChooseCard extends StatelessWidget {
  final CardViewModel _cardViewModel = CardViewModel();
  ChooseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _cardViewModel.start();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          HeaderPadding(
            widget: NestedAppBar(
                title: AppStrings.chooseCard,
                isAdd: true,
                onAddTapped: () => Navigator.pushNamed(
                    context, Routes.accountCardDetails,
                    arguments: const CardDetailParams())),
          ),
          StreamBuilder(
            stream: _cardViewModel.outputCardViewObject,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return Slideshow(
                    indicatorColor: AppColors.primaryBlue,
                    height: 190 + AppPadding.p16 * 2,
                    indicatorRadius: AppSize.s4,
                    indicatorBackgroundColor: AppColors.neutralLight,
                    /*
                    // this is used to indicate the index of card that's used for payment
            onPageChanged: (value) {
               debugPrint('Page changed: $value');
            },
            */
                    children: [
                      for (int i = 0; i < snapshot.data!.length; i++)
                        CreditCard(
                            size: size,
                            number: snapshot.data![i].number!,
                            holder: snapshot.data![i].holder!,
                            expireDate: snapshot.data![i].expireDate!)
                    ]);
              } else {
                return const Center(child: Text('You need to put cards'));
              }
            },
          ),
        ],
      ),
      floatingActionButton: DefaultButton(
          title: AppStrings.pay,
          width: size.width - (AppPadding.p16 * 2),
          onTap: () => Navigator.pushNamed(context, Routes.successRoute,
              arguments: DefaultAlertParams(
                  mainFun: () {
                    // should add the pay order functions here to assure they run when the make order button clicked
                    // index of selected card should be included
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.marketRoute,
                      (route) => false,
                    );
                  },
                  buttonText: AppStrings.backToOrder,
                  message: AppStrings.cartSuccessMessage))),
    );
  }
}
