import 'package:ecommerce_tarek_alabd/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("profile page"),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          auth.signOut();

          Navigator.of(context).pushReplacementNamed(AppRoutes.loginPage);
        },
        child: const Text("logout"),
      )),
    );
  }
}
