import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import 'fragments/account_page.dart';
import 'fragments/cart_page.dart';
import 'fragments/explore_page.dart';
import 'fragments/home_page.dart';
import 'fragments/offer_page.dart';

class MarketParent extends StatefulWidget {
  ///
  ///This is the page where the app start after splash and login
  ///moving around with bottom navigation this page doesn't change
  ///

  const MarketParent({Key? key}) : super(key: key);

  @override
  State<MarketParent> createState() => _MarketParentState();
}

int pageIndex = 0;

List screens = [
  HomePage(),
  ExplorePage(),
  CartPage(),
  const OfferPage(),
  const AccountPage(),
];
const double bottomNavItemsScale = AppSize.s20;

class _MarketParentState extends State<MarketParent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: screens[pageIndex],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // FAB has fixed Size so its children should has fixed values also
      //   onPressed: () {},
      //   child: Stack(
      //     children: [
      //       Positioned(
      //         bottom: 7,
      //         right: 7,
      //         child: Image.asset('assets/icons/nav_items/cart.png'),
      //       ),
      //       const Positioned(
      //         top: 18,
      //         left: 10,
      //         child: Text(''),
      //       ),
      //     ],
      //   ),
      // ),
      // // Docked make the Float in the middle of Bottom Navigation
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.homeIcon,
                scale: bottomNavItemsScale,
                color: pageIndex == 0
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.searchIcon,
                scale: bottomNavItemsScale,
                color: pageIndex == 1
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.cartIcon,
                scale: bottomNavItemsScale,
                color: pageIndex == 2
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.offerIcon,
                scale: bottomNavItemsScale,
                color: pageIndex == 3
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.userIcon,
                scale: bottomNavItemsScale,
                color: pageIndex == 4
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Account',
          ),
        ],
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const AppTextStyles().captionLargeBold,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryBlue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }
}
