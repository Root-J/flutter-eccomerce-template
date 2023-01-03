import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/alerts/success_alert.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/default_button.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/slide_show.dart';
import 'package:flutter/material.dart';

import '../../../../resources/colors_manager.dart';
import '../../../shared_widgets/items/credit_card_item.dart';

class ChooseCard extends StatelessWidget {
  const ChooseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const HeaderPadding(
            widget: NestedAppBar(
              title: AppStrings.chooseCard, isAdd: true,
              // onAddTapped: navigate to add new card
            ),
          ),
          Slideshow(
            indicatorColor: AppColors.primaryBlue,
            height: 190 + AppPadding.p16 * 2,
            indicatorRadius: AppSize.s4,
            indicatorBackgroundColor: AppColors.neutralLight,
            /*
            onPageChanged: (value) {
               debugPrint('Page changed: $value');
            },
            */
            children: [
              for (int i = 0; i < 5; i++)
                CreditCard(
                    size: size,
                    number: '6969696969696969',
                    holder: 'Lailyfa Febrina',
                    expireDate: '19/2042')
            ],
          ),
        ],
      ),
      floatingActionButton: DefaultButton(
          title: AppStrings.pay,
          width: size.width - (AppPadding.p16 * 2),
          onTap: () => Navigator.pushNamed(context, Routes.successRoute,
              arguments: const SuccessAlertParams(
                  buttonText: AppStrings.backToOrder,
                  message: AppStrings.cartSuccessMessage))),
    );
  }
}
