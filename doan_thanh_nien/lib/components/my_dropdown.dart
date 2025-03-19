import 'package:flutter/material.dart';
import '../themes/colors.dart';

class MyDropdown extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function(String) onSelect;
  final bool isActivity;
  final RelativeRect? customPosition;
  const MyDropdown({
    super.key,
    required this.text,
    required this.icon,
    required this.onSelect,
    this.isActivity = false,
    this.customPosition,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> valueActivities = [
      {'value': 'traditional', 'label': 'Hoạt động truyền thống'},
      {'value': 'research', 'label': 'Hoạt động học thuật'},
      {'value': 'union', 'label': 'Hoạt động liên chi đoàn'},
      {'value': 'another', 'label': 'Hoạt động khác'},
    ];

    final List<Map<String, String>> valueSemester = [
      {'value': '1', 'label': 'Học kỳ 1'},
      {'value': '2', 'label': 'Học kỳ 2'},
      {'value': '3', 'label': 'Học kỳ 3'},
      {'value': '4', 'label': 'Học kỳ 4'},
    ];

    final List<Map<String, String>> values =
        isActivity ? valueActivities : valueSemester;

    final RelativeRect menuPosition =
        customPosition ?? const RelativeRect.fromLTRB(0, 360, 0, 0);

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
            position: menuPosition,
            items: values.map((item) {
              return PopupMenuItem<String>(
                value: item['value'],
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
                      item['label']!,
                      style: TextStyle(
                        color: AppColor.bgColor,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            color: AppColor.popupColor,
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
