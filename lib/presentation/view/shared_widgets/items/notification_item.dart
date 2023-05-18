import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';
import 'number_alert.dart';

class NotificationItem extends StatelessWidget {
  final String iconPath;
  final String title;
  final int number;
  final void Function() onTap;
  const NotificationItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.number,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title,
            style: const AppTextStyles()
                .headingH6
                .copyWith(color: AppColors.neutralDark)),
      ),
      leading: Image.asset(
        iconPath,
        scale: AppSize.s20,
        color: AppColors.primaryBlue,
      ),
      onTap: onTap,
      trailing: NumberAlert(number: number),
    );
  }
}
