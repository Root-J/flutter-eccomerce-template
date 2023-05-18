import 'package:ecommerce_flutter/presentation/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';
import '../presentation/view/parent_nav/parent_bottom_nav.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      // initialRoute: Routes.splashRoute,
      title: 'E commerce',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      home: SplashScreen(),
      // home: const MarketParent(),
    );
  }
}
