import 'package:ecommerce_tarek_alabd/utilities/routes.dart';
import 'package:ecommerce_tarek_alabd/views/pages/bottom_navbar.dart';
import 'package:ecommerce_tarek_alabd/views/pages/home_page.dart';
import 'package:ecommerce_tarek_alabd/views/pages/landing_page.dart';
import 'package:flutter/material.dart';
import '../views/pages/auth/auth_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homePage:
      return MaterialPageRoute(
        builder: (_) => const HomePage(),
        settings: settings,
      );
    case AppRoutes.landgingPage:
      return MaterialPageRoute(
        builder: (context) => const LandingPage(),
        settings: settings,
      );
    case AppRoutes.loginPage:
      return MaterialPageRoute(
        builder: (context) => const AuthPage(),
        settings: settings,
      );

    case AppRoutes.bottomNavbar:
      return MaterialPageRoute(
        builder: (context) => const BottomNavbar(),
        settings: settings,
      );

    default:
      return MaterialPageRoute(builder: (context) => const LandingPage());
  }
}
