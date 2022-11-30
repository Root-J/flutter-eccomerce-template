import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/choose_card.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/payment.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/ship_to.dart';
import 'package:ecommerce_flutter/presentation/view/parent_bottom_nav.dart';
import 'package:ecommerce_flutter/presentation/view/screens/favourite_screen.dart';
import 'package:ecommerce_flutter/presentation/view/screens/notification_screen/notification_activity.dart';
import 'package:ecommerce_flutter/presentation/view/screens/notification_screen/notification_feed.dart';
import 'package:ecommerce_flutter/presentation/view/screens/notification_screen/notification_main.dart';
import 'package:flutter/material.dart';

import '../view/fragments/cart_page/success_screen.dart';
import '../view/screens/notification_screen/notification_offer.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String marketRoute = '/market';
  static const String favouritesRoute = '/favourite';
  static const String notificationRoute = '/notification';
  static const String searchRoute = '/search';
  static const String notificationOfferRoute = '/offer';
  static const String notificationFeedRoute = '/feed';
  static const String notificationActivityRoute = '/activity';
  static const String cartShipToRoute = '/ship to';
  static const String cartPaymentRoute = '/payment';
  static const String cartChooseCardRoute = '/choose Card';
  static const String cartSuccessRoute = '/success purchase';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const MarketParent());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const MarketParent());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const MarketParent());
      case Routes.marketRoute:
        return MaterialPageRoute(builder: (_) => const MarketParent());
      case Routes.favouritesRoute:
        return MaterialPageRoute(builder: (_) => FavouriteScreen());
      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.notificationOfferRoute:
        return MaterialPageRoute(builder: (_) => NotificationOfferScreen());
      case Routes.notificationFeedRoute:
        return MaterialPageRoute(builder: (_) => NotificationFeedScreen());
      case Routes.notificationActivityRoute:
        return MaterialPageRoute(builder: (_) => NotificationActivityScreen());
      case Routes.cartChooseCardRoute:
        return MaterialPageRoute(builder: (_) => ChooseCard());
      case Routes.cartPaymentRoute:
        return MaterialPageRoute(builder: (_) => Payment());
      case Routes.cartShipToRoute:
        return MaterialPageRoute(builder: (_) => PickAddress());
      case Routes.cartSuccessRoute:
        return MaterialPageRoute(builder: (_) => SuccessScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text(AppStrings.noRouteFound))));
  }
}
