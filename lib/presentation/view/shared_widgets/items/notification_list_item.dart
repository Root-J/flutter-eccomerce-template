import 'package:flutter/cupertino.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';

class NotificationListItem extends StatelessWidget {
  final bool isIcon;
  final String imagePath;
  final String title;
  final String details;
  final String date;
  const NotificationListItem({
    Key? key,
    this.isIcon = true,
    required this.imagePath,
    required this.title,
    required this.details,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: isIcon,
            child: Image.asset(
              imagePath,
              scale: AppSize.s20,
              color: AppColors.primaryBlue,
            ),
          ),
          Visibility(
            visible: !isIcon,
            child: Image.asset(
              imagePath,
              height: AppSize.s60,
              width: AppSize.s60,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: AppMargin.m8),
          // Figma Flutter Generator Frame461Widget - FRAME - VERTICAL
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    textAlign: TextAlign.left,
                    style: const AppTextStyles().headingH5),
                const SizedBox(height: AppMargin.m8),
                Text(details,
                    style: const AppTextStyles().bodyTextNormalRegular),
                const SizedBox(height: AppMargin.m8),
                Text(date,
                    textAlign: TextAlign.left,
                    style: const AppTextStyles().captionNormalRegular),
                const SizedBox(height: AppMargin.m20),
              ],
            ),
          )
        ],
      ),
    );
  }
}
