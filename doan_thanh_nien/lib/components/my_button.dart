import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const MyButton({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: AppColor.bgButtonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.bgColor,
              fontSize: 16,
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
