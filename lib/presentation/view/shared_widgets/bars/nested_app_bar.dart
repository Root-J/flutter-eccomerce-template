import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/text_header.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/routes_manager.dart';

class NestedAppBar extends StatelessWidget {
  final String title;
  final bool isFullBar;
  final bool isAdd;
  final void Function()? onAddTapped;
  const NestedAppBar({
    Key? key,
    required this.title,
    this.isFullBar = false,
    this.isAdd = false,
    this.onAddTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              SystemIcons.backIcon,
              scale: AppSize.s20,
            )),
        Expanded(
          child: TextHeader(text: title),
        ),
        Visibility(
          visible: isFullBar,
          child: IconButton(
              onPressed: () => Navigator.pushNamed(context, Routes.searchRoute),
              icon: Image.asset(
                SystemIcons.searchIcon,
                scale: AppSize.s20,
              )),
        ),
        Visibility(
          visible: isFullBar,
          child: IconButton(
              onPressed: () => Navigator.pushNamed(context, Routes.searchRoute),
              icon: Image.asset(
                SystemIcons.moreIcon,
                scale: AppSize.s24,
              )),
        ),
        Visibility(
          visible: isAdd,
          child: IconButton(
              onPressed: onAddTapped,
              icon: Image.asset(
                SystemIcons.plusIcon,
                scale: AppSize.s20,
                fit: BoxFit.fill,
                color: AppColors.primaryBlue,
              )),
        ),
      ],
    );
  }
}
