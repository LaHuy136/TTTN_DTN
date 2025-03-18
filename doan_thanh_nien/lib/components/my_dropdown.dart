// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../themes/colors.dart';

class MyDropdown extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function(String) onSelect;
  const MyDropdown({
    super.key,
    required this.text,
    required this.icon,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColor.drawerTileColor,
          size: 25,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: AppColor.drawerTileColor,
          ),
        ),
        onTap: () {
          showMenu<String>(
            context: context,
            position: RelativeRect.fromLTRB(0, 370, 0, 0),
            items: <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'traditional',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: AppColor.bgColor,
                      ),
                    ),
                    title: Text(
                      'Hoạt động truyền thống',
                      style: TextStyle(
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'research',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: AppColor.bgColor,
                      ),
                    ),
                    title: Text(
                      'Hoạt động học thuật',
                      style: TextStyle(
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'union',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: AppColor.bgColor,
                      ),
                    ),
                    title: Text(
                      'Hoạt động liên chi đoàn',
                      style: TextStyle(
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'another',
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    leading: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Icon(
                        Icons.minimize,
                        color: AppColor.bgColor,
                      ),
                    ),
                    title: Text(
                      'Hoạt động khác',
                      style: TextStyle(
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            color: AppColor.popupColor,
            popUpAnimationStyle: AnimationStyle(
              curve: Curves.ease,
              duration: Durations.extralong1,
              reverseCurve: Curves.easeIn,
              reverseDuration: Durations.long3,
            ),
          ).then((value) {
            if (value != null) {
              onSelect(value);
            }
          });
        },
      ),
    );
  }
}
