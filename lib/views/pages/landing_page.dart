import 'package:ecommerce_tarek_alabd/controllers/auth_controller.dart';
import 'package:ecommerce_tarek_alabd/views/pages/auth/auth_page.dart';
import 'package:ecommerce_tarek_alabd/views/pages/bottom_navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authStateChanges,
      builder: (context, snapshot) {
        // if the connection state is active and the user is not null
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;

          if (user == null) {
            // change notifier provider
            return ChangeNotifierProvider<AuthController>(
              create: (_) => AuthController(auth: auth),
              child: const AuthPage(),
            );
          }
          return const BottomNavbar();
        }

        // TODO : WE WILL REFACTOR THIS TO MAKE ONE COMPONENT TO LAODING PAGE
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
