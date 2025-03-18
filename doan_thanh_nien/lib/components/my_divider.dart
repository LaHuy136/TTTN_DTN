import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        color: AppColor.dividerColor,
      ),
    );
  }
}
