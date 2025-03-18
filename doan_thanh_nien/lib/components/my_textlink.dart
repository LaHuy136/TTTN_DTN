import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyTextlink extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const MyTextlink({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto-SemiBold',
              fontSize: 16,
              color: AppColor.headingColor,
            ),
          ),
        ),
      ),
    );
  }
}
