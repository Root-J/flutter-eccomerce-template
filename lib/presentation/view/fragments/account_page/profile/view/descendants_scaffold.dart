import 'package:flutter/material.dart';

import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../../../../shared_widgets/bars/nested_app_bar.dart';
import '../../../../shared_widgets/default_button.dart';
import '../../../../shared_widgets/header_padding.dart';

class ProfileDescendantsScaffold extends StatelessWidget {
  const ProfileDescendantsScaffold({
    Key? key,
    required this.title,
    required this.child,
    required this.fabFun,
  }) : super(key: key);

  final String title;
  final Widget child;
  final void Function() fabFun;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: DefaultButton(
          title: AppStrings.save,
          width: size.width - AppSize.s24,
          onTap: fabFun),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderPadding(widget: NestedAppBar(title: title)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: child,
          )
        ],
      ),
    );
  }
}
