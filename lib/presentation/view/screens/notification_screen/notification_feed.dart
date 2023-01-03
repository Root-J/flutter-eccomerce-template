import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings_manager.dart';
import '../../shared_widgets/bars/nested_app_bar.dart';
import '../../shared_widgets/header_padding.dart';
import '../../shared_widgets/items/notification_list_item.dart';

class NotificationFeedScreen extends StatelessWidget {
  NotificationFeedScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> feedNews = [
    {
      'imagePath': ProductImage.nikeYellowShoeImage,
      'title': 'The Best Title',
      'details':
          'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      'date': 'April 30, 2014 1:01 PM',
    },
    {
      'imagePath': ProductImage.nikeYellowShoeImage,
      'title': 'The Best Title',
      'details':
          'Culpa cillum consectetur labore nulla nulla magna irure. Id veniam culpa officia aute dolor amet deserunt ex proident commodo',
      'date': 'April 30, 2014 1:01 PM',
    },
    {
      'imagePath': ProductImage.nikeYellowShoeImage,
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
            const HeaderPadding(widget: NestedAppBar(title: AppStrings.feed)),
            ListView.builder(
                shrinkWrap: true,
                itemCount: feedNews.length,
                itemBuilder: (context, i) => NotificationListItem(
                      imagePath: feedNews[i]['imagePath'],
                      title: feedNews[i]['title'],
                      details: feedNews[i]['details'],
                      date: feedNews[i]['date'],
                      isIcon: false,
                    ))
          ],
        ),
      ),
    );
  }
}
