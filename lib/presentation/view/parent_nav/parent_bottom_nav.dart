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

  const MarketParent({super.key, this.intIndex = 0});

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
      onPageChanged(widget.intIndex!);
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
    // final selectedIndex = ref.watch();
    return getMarketUI(
        _viewModel.getPagesList[_viewModel.getCurrentIndex], context);
  }

  Widget getMarketUI(fragment, BuildContext context) {
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
                scale: AppCustomSizes.bottomNavItemsScale,
                color: getItemColor(0)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.searchIcon,
                scale: AppCustomSizes.bottomNavItemsScale,
                color: getItemColor(1)),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.cartIcon,
                scale: AppCustomSizes.bottomNavItemsScale,
                color: getItemColor(2)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.offerIcon,
                scale: AppCustomSizes.bottomNavItemsScale,
                color: getItemColor(3)),
            label: 'Offer',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(SystemIcons.userIcon,
                scale: AppCustomSizes.bottomNavItemsScale,
                color: getItemColor(4)),
            label: 'Account',
          ),
        ],
        currentIndex: _viewModel.getCurrentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const AppTextStyles().captionLargeBold,
        unselectedItemColor: Colors.grey,
        selectedItemColor: AppColors.primaryBlue,
        onTap: onPageChanged,
      ),
    );
  }

  void onPageChanged(int index) => setState(() => _viewModel.setIndex(index));

  Color getItemColor(int index) => _viewModel.getCurrentIndex == index
      ? AppColors.primaryBlue
      : AppColors.neutralGrey;
}
