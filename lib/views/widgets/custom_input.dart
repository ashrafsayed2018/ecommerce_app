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
  final void Function(String)? onChanged;
  final Icon? icon;
  const CustomInput({
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.keyboardType,
    required this.isPassowrd,
    required this.validate,
    required this.focusNode,
    required this.onEditingComplete,
    required this.onChanged,
    this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      obscureText: isPassowrd,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        labelText: labelText,
        prefix: icon,
        hintText: hintText,
        labelStyle: Theme.of(context).textTheme.subtitle1,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
      validator: validate,
      onChanged: onChanged,
    );
  }
}
