import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyHeading extends StatelessWidget {
  final String text;
  const MyHeading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
            color: AppColor.headingColor,
            fontFamily: 'Poppins-SemiBold',
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
