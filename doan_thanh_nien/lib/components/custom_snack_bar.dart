import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;

  const CustomSnackBar({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: backgroundColor,
      content: Text(
        message,
        style: TextStyle(color: textColor),
      ),
    );
  }

  static void showSnackBar(BuildContext context, String message,
      Color backgroundColor, Color textColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(  
        duration: const Duration(seconds: 1),
        backgroundColor: backgroundColor,
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
