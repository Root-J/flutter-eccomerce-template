import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/descendants_scaffold.dart';
import 'package:flutter/material.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  @override
  Widget build(BuildContext context) {
    return ProfileDescendantsScaffold(
        title: AppStrings.birthday,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppStrings.your} ${AppStrings.birthday}',
                style: const AppTextStyles()
                    .headingH5
                    .copyWith(color: AppColors.neutralDark)),
          ],
        ),
        fabFun: () {});
  }
}
