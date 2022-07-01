import 'package:ecommerce_tarek_alabd/services/auth.dart';
import 'package:ecommerce_tarek_alabd/utilities/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utilities/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (_) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ecommerce app',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFE5E5E5),
          primaryColor: Colors.red,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),
        ),
        initialRoute: AppRoutes.landgingPage,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
