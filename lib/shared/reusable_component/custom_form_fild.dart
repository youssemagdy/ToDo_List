import 'package:flutter/material.dart';

// ignore: camel_case_types
typedef filedValidation = String? Function(String?)?;
// ignore: must_be_immutable
class CustomFormFiled extends StatelessWidget {
  CustomFormFiled({
    Key? key,
    required this.label,
    required this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.validation,
    required this.controller,
  }) : super(key: key);

  String label;
  TextInputType keyboardType;
  bool obscureText;
  Widget? suffixIcon;
  filedValidation validation;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      validator: validation,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 17,
      ),
      obscureText: obscureText,
      obscuringCharacter: '*',
      controller: controller,
    );
  }
}
