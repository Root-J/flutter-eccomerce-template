import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/colors_manager.dart';
import '../../../resources/text_styles_manager.dart';
import '../../../resources/values_manager.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchController,
    required this.searchFocusNode,
  }) : super(key: key);

  final TextEditingController searchController;
  final FocusNode searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: AppElevation.e3,
      borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
      child: TextField(
          style: const AppTextStyles().bodyTextNormalRegular,
          controller: searchController,
          focusNode: searchFocusNode,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
              borderSide: const BorderSide(color: AppColors.primaryBlue),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
                borderSide: const BorderSide(color: Colors.transparent)),
            isDense: true,
            hintText: AppStrings.searchProduct,
            prefixIcon: const Icon(Icons.search, size: AppSize.s24),
          )),
    );
  }
}
