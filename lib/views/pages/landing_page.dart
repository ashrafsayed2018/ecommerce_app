import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ecommerce app'),
      ),
      body: const Center(
        child: Text('Landing Page'),
      ),
    );
  }
}
