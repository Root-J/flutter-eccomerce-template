import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/bars/coupon_bar.dart';
import '../shared_widgets/header_padding.dart';
import '../shared_widgets/items/sales_ad.dart';
import '../shared_widgets/text_header.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          HeaderPadding(widget: TextHeader(text: 'Offer')),
          CouponBar(
              message:
                  'Use “MEGSL” Coupon For Get 90%off'), // ToDo add Api call that create that coupon
          SizedBox(height: 24),
          SaleAd(
            bgImagePath: PromotionImage.redShoeImage,
            widget: SaleAdClock(
                seconds: 25000, saleName: 'Super Flash Sale', discount: 50),
          ),
          SizedBox(height: 24),
          SaleAd(
              bgImagePath: PromotionImage.whiteShoeImage,
              widget: RecommendationTexts(
                  title:
                      '90% Off Super Mega Sale', // ToDo add Api call that create Sale Ad Widget
                  subtitle: 'Special birthday gift for you')),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
