import 'package:ecommerce_flutter/constants/const_text_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(5),
                  child: TextField(
                      style: kNormal(),
                      controller: searchController,
                      focusNode: searchFocusNode,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: kBlue),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Colors.transparent)),
                        isDense: true,
                        hintText: "Search Product",
                        prefixIcon: const Icon(Icons.search, size: 24),
                      )),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline_rounded,
                      color: kGrey, size: 30)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined,
                      color: kGrey, size: 30)),
            ],
          )
        ],
      ),
    );
  }
}
