import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/nested_app_bar.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/header_padding.dart';
import 'package:flutter/material.dart';

import '../../../resources/routes_manager.dart';
import '../../shared_widgets/items/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderPadding(
              widget: NestedAppBar(title: AppStrings.notification)),
          NotificationItem(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.notificationOfferRoute),
              iconPath: SystemIcons.offerIcon,
              title: AppStrings.offer,
              number: 2),
          const SizedBox(height: AppSize.s24),
          NotificationItem(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.notificationFeedRoute),
              iconPath: SystemIcons.listIcon,
              title: AppStrings.feed,
              number: 3),
          const SizedBox(height: AppSize.s24),
          NotificationItem(
              onTap: () => Navigator.pushNamed(
                  context, Routes.notificationActivityRoute),
              iconPath: SystemIcons.notificationIcon,
              title: AppStrings.activity,
              number: 3),
        ],
      ),
    );
  }
}
