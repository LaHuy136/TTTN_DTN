// import 'package:doan_thanh_nien/components/my_icon_button_date.dart';
import 'package:flutter/material.dart';

import '../helpers/volunteer_activities.dart';

class News extends ChangeNotifier {
  // list of activity
  final List<volunteerActivities> _activity = [
    // traditional
    volunteerActivities(
      imagePath: 'assets/images/mua_he.jpg',
      title: 'Trồng cây xanh',
      day: '27/6/2025 - 29/6/2025',
      location: 'Xã Pá Hu, huyện Trạm Tấu, Tỉnh Yên Bái',
      registeredNumber: 0,
      category: volunteerActivitiesCategory.traditional,
    ),

    // research
    volunteerActivities(
      imagePath: 'assets/images/research.jpg',
      title: 'Dạy các bé học vẽ',
      day: '20/08/2024 - 22/08/2024',
      location: 'Trường Đại học Bách Khoa Hà Nội',
      registeredNumber: 0,
      category: volunteerActivitiesCategory.research,
    ),

    // union
    volunteerActivities(
      imagePath: 'assets/images/union.jpg',
      title: 'Giúp đỡ các bé hoàn cảnh khó khăn',
      day: '27/07/2024 - 05/08/2024',
      location: 'Trường THCS Phú Diễn A, Hà Nội',
      registeredNumber: 0,
      category: volunteerActivitiesCategory.union,
    ),

    // another
    volunteerActivities(
      imagePath: 'assets/images/hien_mau.jpg',
      title: 'Hiến máu nhân đạo',
      day: '18/09/2024 - 20/09/2024',
      location: 'Trường THPT Kim Đồng, Hà Nội',
      registeredNumber: 0,
      category: volunteerActivitiesCategory.another,
    ),
  ];

  List<volunteerActivities> getActivitiesByCategory(String category) {
    if (category == 'All') {
      return _activity;
    }
    return _activity
        .where((activity) =>
            activity.category.toString().split('.').last == category)
        .toList();
  }

  List<volunteerActivities> filteredActivities(String title) {
    return _activity
        .where((activity) =>
            activity.title.toLowerCase().contains(title.toLowerCase()))
        .toList();
  }
}
