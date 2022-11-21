import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../constants/const_colors.dart';
import '../shared_widgets/bars/search_bar.dart';
import '../shared_widgets/bars/see_more_bar.dart';
import '../shared_widgets/items/category_Item.dart';
import '../shared_widgets/items/sale_item.dart';
import '../shared_widgets/items/sales_ad.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  final List<Map<String, dynamic>> sales = [
    {
      'image': 'assets/images/Products/image 46.png',
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
      'net_cost': 299.43,
    },
    {
      'image': 'assets/images/Products/image 54.png',
      'name': 'FS - QUILTED MAXI CROS...',
      'actual_cost': 534.33,
      'discount': 24,
      'net_cost': 299.43,
    },
    {
      'image': 'assets/images/Products/image 49.png',
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
      'net_cost': 299.43,
    },
    {
      'image': 'assets/images/Products/image 46.png',
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
      'net_cost': 299.43,
    },
    {
      'image': 'assets/images/Products/image 54.png',
      'name': 'FS - QUILTED MAXI CROS...',
      'actual_cost': 534.33,
      'discount': 24,
      'net_cost': 299.43,
    },
    {
      'image': 'assets/images/Products/image 49.png',
      'name': 'FS - Nike Air Max 270 React...',
      'actual_cost': 534.33,
      'discount': 24,
      'net_cost': 299.43,
    },
    {
      'image': 'assets/images/Products/image 46.png',
      'name': 'assets/images/Products/image 54.png',
      'actual_cost': 534.33,
      'discount': 24,
      'net_cost': 299.43,
    },
  ];

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
    Size size = MediaQuery.of(context).size;
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
          ImageSlideshow(
            indicatorColor: AppColors.primaryBlue,
            // onPageChanged: (value) {
            //   debugPrint('Page changed: $value');
            // },
            autoPlayInterval: 3000,
            isLoop: true,
            children: [
              const SaleAd(
                  bgImagePath: 'assets/images/Promotion Image/image 50.png',
                  widget: SaleAdClock(
                      seconds: 30000,
                      saleName: 'Super Flash Sale',
                      discount: 50)),
              Image.asset(
                'assets/images/Promotion Image/image 50.png',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/Promotion Image/image 50.png',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/Promotion Image/image 50.png',
                fit: BoxFit.fill,
              ),
              Image.asset(
                'assets/images/Promotion Image/image 50.png',
                fit: BoxFit.fill,
              ),
            ],
          ),
          //Categories
          SeeMoreBar(
              onTap: () {}, title: 'Category', txtButton: 'More Category'),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                // display each item of the product list
                itemBuilder: (BuildContext context, int index) {
                  return CategoryItem(
                      imagePath: categories[index][1],
                      title: categories[index][0]);
                }),
          ),

          //Flash Sale
          const SizedBox(height: 24),
          SeeMoreBar(onTap: () {}, title: 'Flash Sale'),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // the number of items in the list
                itemCount: sales.length,
                // display each item of the product list
                itemBuilder: (BuildContext context, int index) {
                  return SaleItem(
                      imagePath: sales[index]['image'],
                      actualCost: sales[index]['actual_cost'],
                      discount: sales[index]['discount'],
                      netCost: sales[index]['net_cost'],
                      productName: sales[index]['name']);
                }),
          ),

          //Mega Sale
          const SizedBox(height: 24),
          SeeMoreBar(onTap: () {}, title: 'Mega Sale'),
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // the number of items in the list
                itemCount: sales.length,
                // display each item of the product list
                itemBuilder: (BuildContext context, int index) {
                  return SaleItem(
                      imagePath: sales[index]['image'],
                      actualCost: sales[index]['actual_cost'],
                      discount: sales[index]['discount'],
                      netCost: sales[index]['net_cost'],
                      productName: sales[index]['name']);
                }),
          ),
          const SaleAd(
              bgImagePath: 'assets/images/Promotion Image/image 51.png',
              widget: RecommendationTexts(
                title: 'Recommended Product',
                subtitle: 'We recommend the best for you',
              )),
          const SizedBox(height: 8),
          //Grid Products
          GridView.builder(
            shrinkWrap: true,
            itemCount: sales.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => SaleItem(
                imagePath: sales[index]['image'],
                actualCost: sales[index]['actual_cost'],
                discount: sales[index]['discount'],
                netCost: sales[index]['net_cost'],
                productName: sales[index]['name'],
                isGrid: true,
                size: size),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              childAspectRatio: ((size.width / 2) - (8 * 3)) / 280,
            ),
          )
        ],
      ),
    );
  }
}
