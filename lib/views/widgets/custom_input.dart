import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPassowrd;
  final String? Function(String?)? validate;
  final FocusNode focusNode;
  final void Function() onEditingComplete;
  const CustomInput({
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.isPassowrd,
    required this.validate,
    required this.focusNode,
    required this.onEditingComplete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isPassowrd,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: Theme.of(context).textTheme.subtitle1,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      validator: validate,
    );
  }
}
