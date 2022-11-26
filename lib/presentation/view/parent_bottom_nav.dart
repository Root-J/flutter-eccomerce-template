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
  const ExplorePage(),
  const CartPage(),
  const OfferPage(),
  const AccountPage(),
];

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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Account',
          ),
        ],
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
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
