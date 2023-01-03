import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/account_page.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/birthday_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/email_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/gender_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/name_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/phone_number_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/profile_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/view/choose_card.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/view/payment.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/cart_page/view/ship_to.dart';
import 'package:ecommerce_flutter/presentation/view/parent_nav/parent_bottom_nav.dart';
import 'package:ecommerce_flutter/presentation/view/parent_nav/parent_bottom_nav_view_model.dart';
import 'package:ecommerce_flutter/presentation/view/screens/favourite_screen.dart';
import 'package:ecommerce_flutter/presentation/view/screens/notification_screen/notification_activity.dart';
import 'package:ecommerce_flutter/presentation/view/screens/notification_screen/notification_feed.dart';
import 'package:ecommerce_flutter/presentation/view/screens/notification_screen/notification_main.dart';
import 'package:flutter/material.dart';

import '../view/fragments/account_page/profile/view/change_password_screen.dart';
import '../view/screens/notification_screen/notification_offer.dart';
import '../view/shared_widgets/alerts/success_alert.dart';

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
  static const String cartPaymentRoute = '/cart/payment';
  static const String cartChooseCardRoute = '/choose Card';
  static const String successRoute = '/success purchase';
  static const String accountRoute = '/account';
  static const String accountProfileRoute = '$marketRoute/profile';
  static const String accountOrderRoute = '/order';
  static const String accountAddressRoute = '/address';
  static const String accountPaymentRoute = '$accountRoute/payment';
  static const String accountNameRoute = '$accountProfileRoute/name';
  static const String accountGenderRoute = '$accountProfileRoute/gender';
  static const String accountBirthdayRoute = '$accountProfileRoute/birthday';
  static const String accountEmailRoute = '$accountProfileRoute/email';
  static const String accountPhoneNumberRoute =
      '$accountProfileRoute/phone number';
  static const String accountChangePassword =
      '$accountProfileRoute/change password';
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
        final parentArgs = settings.arguments as ParentIndexParams?;
        return MaterialPageRoute(
            builder: (_) => MarketParent(
                  intIndex: parentArgs?.intIndex ?? 0,
                ));
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
        return MaterialPageRoute(builder: (_) => const ChooseCard());
      case Routes.cartPaymentRoute:
        return MaterialPageRoute(builder: (_) => const Payment());
      case Routes.cartShipToRoute:
        return MaterialPageRoute(builder: (_) => const PickAddress());
      case Routes.successRoute:
        final successArgs = settings.arguments as SuccessAlertParams;
        return MaterialPageRoute(
            builder: (_) => SuccessScreen(
                  buttonText: successArgs.buttonText,
                  message: successArgs.message,
                ));
      case Routes.accountRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case Routes.accountProfileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.accountOrderRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case Routes.accountAddressRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case Routes.accountPaymentRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case Routes.accountNameRoute:
        return MaterialPageRoute(builder: (_) => const NameScreen());
      case Routes.accountGenderRoute:
        return MaterialPageRoute(builder: (_) => const GenderScreen());
      case Routes.accountBirthdayRoute:
        return MaterialPageRoute(builder: (_) => const BirthdayScreen());
      case Routes.accountEmailRoute:
        return MaterialPageRoute(builder: (_) => const EmailScreen());
      case Routes.accountPhoneNumberRoute:
        return MaterialPageRoute(builder: (_) => const PhoneNumberScreen());
      case Routes.accountChangePassword:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
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
