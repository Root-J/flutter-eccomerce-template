import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/bars/coupon_bar.dart';
import '../shared_widgets/header_padding.dart';
import '../shared_widgets/items/sales_ad.dart';
import '../shared_widgets/text_header.dart';

int offerSeconds = 25000;

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const HeaderPadding(widget: TextHeader(text: AppStrings.offer)),
          const CouponBar(
              message:
                  'Use “MEGSL” Coupon For Get 90%off'), // ToDo add Api call that create that coupon
          const SizedBox(height: AppMargin.m24),
          SaleAd(
            bgImagePath: PromotionImage.redShoeImage,
            widget: SaleAdClock(
                seconds: offerSeconds, saleName: AppStrings.flashSale, discount: 50),
          ),
          const SizedBox(height: AppMargin.m24),
          const SaleAd(
              bgImagePath: PromotionImage.whiteShoeImage,
              widget: RecommendationTexts(
                  title:
                      '90% Off Super Mega Sale', // ToDo add Api call that create Sale Ad Widget
                  subtitle: 'Special birthday gift for you')),
          const SizedBox(height: AppMargin.m24),
        ],
      ),
    );
  }
}
