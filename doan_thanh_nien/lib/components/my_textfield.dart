// ignore_for_file: prefer_const_constructors

import 'package:doan_thanh_nien/themes/colors.dart';
import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final Function(dynamic)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obsecureText,
    this.onChanged,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.textFieldColor,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.textFieldColor,
              ),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColor.bordertfColor
              ),
              borderRadius: BorderRadius.circular(8.0)),
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins-Medium',
            fontSize: 16,
            color: AppColor.textForHintextColor,
            letterSpacing: 0.7,
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        ),
      ),
    );
  }
}
