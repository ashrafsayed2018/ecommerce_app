import 'package:ecommerce_tarek_alabd/utilities/routes.dart';
import 'package:ecommerce_tarek_alabd/views/pages/landing_page.dart';
import 'package:flutter/material.dart';
import '../views/pages/auth/auth_page.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.landgingPage:
      return MaterialPageRoute(builder: (context) => const LandingPage());
    case AppRoutes.loginPage:
      return MaterialPageRoute(builder: (context) => const AuthPage());

    default:
      return MaterialPageRoute(
          builder: (context) => Text('Unknown route: ${settings.name}'));
  }
}
