import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../resources/text_styles_manager.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          Text(AppStrings.accountPage, style: const AppTextStyles().headingH1),
    );
  }
}
