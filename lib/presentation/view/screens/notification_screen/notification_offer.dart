import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings_manager.dart';
import '../../shared_widgets/bars/nested_app_bar.dart';
import '../../shared_widgets/header_padding.dart';
import '../../shared_widgets/items/notification_list_item.dart';

class NotificationOfferScreen extends StatelessWidget {
  NotificationOfferScreen({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> offerNews = [
    {
      'imagePath': SystemIcons.offerIcon,
      'title': 'The Best Title',
      'details':
          'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      'date': 'April 30, 2014 1:01 PM',
    },
    {
      'imagePath': SystemIcons.offerIcon,
      'title': 'The Best Title',
      'details':
          'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      'date': 'April 30, 2014 1:01 PM',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderPadding(widget: NestedAppBar(title: AppStrings.offer)),
            ListView.builder(
                shrinkWrap: true,
                itemCount: offerNews.length - 1,
                itemBuilder: (context, i) => NotificationListItem(
                    imagePath: offerNews[i]['imagePath'],
                    title: offerNews[i]['title'],
                    details: offerNews[i]['details'],
                    date: offerNews[i]['date']))
          ],
        ),
      ),
    );
  }
}
