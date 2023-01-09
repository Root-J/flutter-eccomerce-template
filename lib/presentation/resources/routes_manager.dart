import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/account_page.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/address/view/add_address_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/address/view/address_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/address/view/edit_address_screen.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view/card_details.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view/card_screen.dart';
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
import 'package:ecommerce_flutter/presentation/view/shared_widgets/alerts/confirmation_alert.dart';
import 'package:flutter/material.dart';

import '../view/fragments/account_page/profile/view/change_password_screen.dart';
import '../view/screens/notification_screen/notification_offer.dart';
import '../view/shared_widgets/alerts/success_alert.dart';

class Routes {
  // app start
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String marketRoute = '/market';

  static const String favouritesRoute = '/favourite';

  // Notification
  static const String notificationRoute = '/notification';
  static const String searchRoute = '/search';
  static const String notificationOfferRoute = '/offer';
  static const String notificationFeedRoute = '/feed';
  static const String notificationActivityRoute = '/activity';

  // Cart
  static const String cartRoute = '/cart';
  static const String cartShipToRoute = '$cartRoute/ship to';
  static const String paymentRoute = '/payment';
  static const String cartChooseCardRoute = '$cartRoute/choose Card';

  // Alerts
  static const String successRoute = '/success';
  static const String confirmationRoute = '/confirmation';

  // Account
  static const String accountRoute = '/account';
  static const String accountProfileRoute = '$accountRoute/profile';
  static const String accountOrderRoute = '$accountRoute/order';
  static const String accountAddressRoute = '$accountRoute/address';
  static const String accountPaymentRoute = '$accountRoute/payment';

  // Profile
  static const String accountNameRoute = '$accountProfileRoute/name';
  static const String accountGenderRoute = '$accountProfileRoute/gender';
  static const String accountBirthdayRoute = '$accountProfileRoute/birthday';
  static const String accountEmailRoute = '$accountProfileRoute/email';
  static const String accountPhoneNumberRoute =
      '$accountProfileRoute/phone number';
  static const String accountChangePassword =
      '$accountProfileRoute/change password';

  // Address
  static const String accountAddAddressRoute =
      "$accountAddressRoute/add address";
  static const String accountEditAddressRoute =
      "$accountAddressRoute/edit address";

  // Card
  static const String accountCreditCard = '$accountRoute/credit card';
  static const String accountCardDetails = "$accountCreditCard/card details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // App init
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

      // App Bar
      case Routes.favouritesRoute:
        return MaterialPageRoute(builder: (_) => FavouriteScreen());
      // Notification
      case Routes.notificationRoute:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.notificationOfferRoute:
        return MaterialPageRoute(builder: (_) => NotificationOfferScreen());
      case Routes.notificationFeedRoute:
        return MaterialPageRoute(builder: (_) => NotificationFeedScreen());
      case Routes.notificationActivityRoute:
        return MaterialPageRoute(builder: (_) => NotificationActivityScreen());

      // Cart
      case Routes.cartChooseCardRoute:
        return MaterialPageRoute(builder: (_) => ChooseCard());
      case Routes.paymentRoute:
        final paymentArgs = settings.arguments as PaymentParams;
        return MaterialPageRoute(
            builder: (_) => Payment(isAccount: paymentArgs.isAccount));
      case Routes.cartShipToRoute:
        return MaterialPageRoute(builder: (_) => const PickAddress());

      // Alerts
      case Routes.successRoute:
        final successArgs = settings.arguments as DefaultAlertParams;
        return MaterialPageRoute(
            builder: (_) => SuccessScreen(
                  mainFun: successArgs.mainFun,
                  buttonText: successArgs.buttonText,
                  message: successArgs.message,
                ));
      case Routes.confirmationRoute:
        final confirmationArgs = settings.arguments as DefaultAlertParams;
        return MaterialPageRoute(
            builder: (_) => ConfirmationScreen(
                  mainFun: confirmationArgs.mainFun,
                  buttonText: confirmationArgs.buttonText,
                  message: confirmationArgs.message,
                ));

      // Account
      case Routes.accountRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case Routes.accountProfileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.accountOrderRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());
      case Routes.accountAddressRoute:
        return MaterialPageRoute(builder: (_) => const AddressScreen());
      case Routes.accountPaymentRoute:
        return MaterialPageRoute(builder: (_) => const AccountPage());

      // Profile
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

      // Address
      case Routes.accountAddAddressRoute:
        return MaterialPageRoute(builder: (_) => const AddAddressScreen());
      case Routes.accountEditAddressRoute:
        final editAddressArgs = settings.arguments as EditAddressScreenParams;
        return MaterialPageRoute(
            builder: (_) => EditAddressScreen(
                  addressModel: editAddressArgs.addressModel,
                  index: editAddressArgs.index,
                ));

      //Card
      case Routes.accountCreditCard:
        return MaterialPageRoute(builder: (_) => CardScreen());
      case Routes.accountCardDetails:
        return MaterialPageRoute(builder: (_) => const CardDetails());
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
