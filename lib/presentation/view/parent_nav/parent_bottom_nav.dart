import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/parent_nav/parent_bottom_nav_view_model.dart';
import 'package:flutter/material.dart';

class MarketParent extends StatefulWidget {
  ///
  ///This is the page where the app start after splash and login
  ///moving around with bottom navigation this page doesn't change
  ///

  final int? intIndex;

  const MarketParent({Key? key, this.intIndex}) : super(key: key);

  @override
  State<MarketParent> createState() => _MarketParentState();
}

// List screens = [
//   HomePage(),
//   ExplorePage(),
//   const CartPage(),
//   const OfferPage(),
//   const AccountPage(),
// ];

const double bottomNavItemsScale = AppSize.s20;

class _MarketParentState extends State<MarketParent> {
  final MarketParentViewModel _viewModel = MarketParentViewModel();

  _bind() {
    _viewModel.start();
    if (widget.intIndex != null) {
      _viewModel.onPageChanged(widget.intIndex!);
    }
  }

  // int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.outputNavViewObject,
        builder: (context, snapshot) {
          return getMarketUI(snapshot.data);
        });
  }

  Widget getMarketUI(fragment) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p16, vertical: AppPadding.p24),
            child: fragment
            // screens[pageIndex],
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
                color: _viewModel.getCurrentIndex == 0
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.searchIcon,
                scale: bottomNavItemsScale,
                color: _viewModel.getCurrentIndex == 1
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.cartIcon,
                scale: bottomNavItemsScale,
                color: _viewModel.getCurrentIndex == 2
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.offerIcon,
                scale: bottomNavItemsScale,
                color: _viewModel.getCurrentIndex == 3
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.userIcon,
                scale: bottomNavItemsScale,
                color: _viewModel.getCurrentIndex == 4
                    ? AppColors.primaryBlue
                    : AppColors.neutralGrey),
            label: 'Account',
          ),
        ],
        currentIndex: _viewModel.getCurrentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const AppTextStyles().captionLargeBold,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryBlue,
        onTap: _viewModel.onPageChanged,
      ),
    );
  }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     pageIndex = index;
  //   });
  // }
}
