import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validatorFn;
  final Function(String?) onSavedFn;
  final String initialValue;
  final TextInputType? keyboardType;
  final bool obscureText;
  final IconData prefixIcon;

  CustomTextFormField({
    required this.hintText,
    required this.validatorFn,
    required this.onSavedFn,
    this.initialValue = '',
    this.keyboardType,
    this.obscureText = false,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      initialValue: initialValue,
      validator: validatorFn,
      onSaved: onSavedFn,
    );
  }
}
