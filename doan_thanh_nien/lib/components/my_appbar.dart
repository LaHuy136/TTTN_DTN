import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icon;
  final Function()? onPressed;
  final Function(String)? onSelected;
  const MyAppbar({super.key, this.icon, this.onPressed, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        // search button
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
        ),
      ],
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: AppColor.appBarColor,
      title: Padding(
        padding: const EdgeInsets.only(left: 15.0 ,bottom: 10.0),
        child: Image.asset(
          'assets/images/appbar_logo.jpg',
          width: 85,
          height: 85,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
