import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/routes_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/shared_widgets/bars/search_bar.dart';
import 'package:flutter/material.dart';

class AppBarActiveSearch extends StatelessWidget {
  const AppBarActiveSearch({
    Key? key,
    required this.searchController,
    required this.searchFocusNode,
  }) : super(key: key);

  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            // expanded widget here make the search bar takes the available space
            child: CustomSearchBar(
                searchController: searchController,
                searchFocusNode: searchFocusNode)),
        const SizedBox(width: AppMargin.m8),
        GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(Routes.favouritesRoute),
            child: Image.asset(
              SystemIcons.loveIcon,
              scale: AppSize.s20,
            )),
        const SizedBox(width: AppMargin.m8),
        GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(Routes.notificationRoute),
            child: Image.asset(
              SystemIcons.notificationIcon,
              scale: AppSize.s20,
            )),
      ],
    );
  }
}
