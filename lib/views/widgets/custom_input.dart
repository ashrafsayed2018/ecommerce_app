import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassowrd;
  const CustomInput({
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.isPassowrd,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isPassowrd,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: Theme.of(context).textTheme.subtitle1,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
