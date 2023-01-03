import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../shared_widgets/bars/nested_app_bar.dart';
import '../../shared_widgets/header_padding.dart';
import '../../shared_widgets/items/notification_list_item.dart';

class NotificationActivityScreen extends StatelessWidget {
  NotificationActivityScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> activityNews = [
    {
      'imagePath': SystemIcons.transactionIcon,
      'title': 'The Best Title',
      'details':
          'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      'date': 'April 30, 2014 1:01 PM',
    },
    {
      'imagePath': SystemIcons.transactionIcon,
      'title': 'The Best Title',
      'details':
          'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      'date': 'April 30, 2014 1:01 PM',
    },
    {
      'imagePath': SystemIcons.transactionIcon,
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
            const HeaderPadding(
                widget: NestedAppBar(title: AppStrings.activity)),
            ListView.builder(
                shrinkWrap: true,
                itemCount: activityNews.length,
                itemBuilder: (context, i) => NotificationListItem(
                    imagePath: activityNews[i]['imagePath'],
                    title: activityNews[i]['title'],
                    details: activityNews[i]['details'],
                    date: activityNews[i]['date']))
          ],
        ),
      ),
    );
  }
}
