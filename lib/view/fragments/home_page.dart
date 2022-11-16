import 'package:ecommerce_flutter/constants/const_text_styles.dart';
import 'package:flutter/material.dart';

import '../../constants/const_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  final List<List<String>> categories = [
    ['Bikini', 'assets/icons/Product_icon/24px/bikini.png'],
    ['Dress', 'assets/icons/Product_icon/24px/dress.png'],
    ['Man Bag', 'assets/icons/Product_icon/24px/man bag.png'],
    ['Man Pants', 'assets/icons/Product_icon/24px/man pants.png'],
    ['Man Shoes', 'assets/icons/Product_icon/24px/man shoes.png'],
    ['Man Underwear', 'assets/icons/Product_icon/24px/man underwear.png'],
    ['Shirt', 'assets/icons/Product_icon/24px/shirt.png'],
    ['Skirt', 'assets/icons/Product_icon/24px/skirt.png'],
    ['T-shirt', 'assets/icons/Product_icon/24px/Tshirt.png'],
    ['Woman Bag', 'assets/icons/Product_icon/24px/woman bag.png'],
    ['Woman Pants', 'assets/icons/Product_icon/24px/woman pants.png'],
    ['Woman Shoes', 'assets/icons/Product_icon/24px/woman shoes.png'],
    ['Woman T-shirt', 'assets/icons/Product_icon/24px/woman tshirt.png'],
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          // Header Bar
          Row(
            children: [
              Expanded(
                child: SearchBar(
                    searchController: searchController,
                    searchFocusNode: searchFocusNode),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline_rounded,
                      color: AppColors.neutralGrey, size: 30)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_outlined,
                      color: AppColors.neutralGrey, size: 30)),
            ],
          ),
          const SizedBox(height: 24),
          //Categories
          SeeMoreBar(
              onTap: () {}, title: 'Category', txtButton: 'More Category'),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // the number of items in the list
                itemCount: categories.length,
                // display each item of the product list
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(
                      imagePath: categories[index][1],
                      title: categories[index][0]);
                }),
          ),
          SeeMoreBar(onTap: () {}, title: 'Flash Sale'),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String imagePath;
  final String title;
  const CategoryItem({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              border: Border.all(
                color: AppColors.neutralLight,
                width: 1,
              ),
            ),
            child: Image.asset(imagePath, scale: 20),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const AppTextStyles()
                .captionNormalRegular
                .copyWith(color: AppColors.neutralGrey),
          )
        ],
      ),
    );
  }
}

class SeeMoreBar extends StatelessWidget {
  final String title;
  final String txtButton;
  final void Function() onTap;

  const SeeMoreBar({
    Key? key,
    required this.title,
    this.txtButton = 'See More',
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const AppTextStyles()
              .bodyTextMediumBold
              .copyWith(color: AppColors.neutralDark),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            txtButton,
            style: const AppTextStyles()
                .bodyTextMediumBold
                .copyWith(color: AppColors.primaryBlue),
          ),
        )
      ],
    );
  }
}

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
      elevation: 3,
      borderRadius: BorderRadius.circular(5),
      child: TextField(
          style: const AppTextStyles().bodyTextNormalRegular,
          controller: searchController,
          focusNode: searchFocusNode,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: AppColors.primaryBlue),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.transparent)),
            isDense: true,
            hintText: "Search Product",
            prefixIcon: const Icon(Icons.search, size: 24),
          )),
    );
  }
}
