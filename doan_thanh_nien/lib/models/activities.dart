// import 'package:doan_thanh_nien/components/my_icon_button_date.dart';
import 'package:flutter/material.dart';
import '../helpers/volunteer_activities.dart';

class News extends ChangeNotifier {
  // list of activity
  final List<volunteerActivities> _activity = [
    // traditional
    volunteerActivities(
      eventId: 11,
      imagePath: 'assets/images/mua_he.jpg',
      name: 'Trồng cây xanh',
      date: '30/6/2025 - ',
      endDate: '1/7/2025',
      registrationStartDate: '27/6/2025 - ',
      registrationEndDate: '29/6/2025',
      location: 'Xã Pá Hu, huyện Trạm Tấu, Tỉnh Yên Bái',
      currentRegistrations: 0,
      maxRegistrations: 50,
      eventType: 'Hoạt động tình nguyện',
      score: 50,
      category: volunteerActivitiesCategory.traditional,
    ),

    // research
    volunteerActivities(
      eventId: 12,
      imagePath: 'assets/images/research.jpg',
      name: 'Dạy các bé học vẽ',
      date: '23/8/2025 - ',
      endDate: '25/8/2025',
      registrationStartDate: '20/08/2024 - ',
      registrationEndDate: '22/08/2024',
      location: 'Trường Đại học Bách Khoa Hà Nội',
      currentRegistrations: 0,
      maxRegistrations: 50,
      eventType: 'Hoạt động nghiên cứu',
      score: 50,
      category: volunteerActivitiesCategory.research,
    ),

    // union
    volunteerActivities(
      eventId: 13,
      imagePath: 'assets/images/union.jpg',
      name: 'Giúp đỡ các bé hoàn cảnh khó khăn',
      date: '06/08/2025 - ',
      endDate: '09/08/2025',
      registrationStartDate: '27/07/2024 - ',
      registrationEndDate: '05/08/2024',
      location: 'Trường THCS Phú Diễn A, Hà Nội',
      currentRegistrations: 0,
      maxRegistrations: 50,
      eventType: 'Hoạt động liên chi đoàn',
      score: 50,
      category: volunteerActivitiesCategory.union,
    ),

    // another
    volunteerActivities(
      eventId: 14,
      imagePath: 'assets/images/hien_mau.jpg',
      name: 'Hiến máu nhân đạo',
      date: '21/09/2025 - ',
      endDate: '23/09/2025',
      registrationStartDate: '18/09/2024 - ',
      registrationEndDate: '20/09/2024',
      location: 'Trường THPT Kim Đồng, Hà Nội',
      currentRegistrations: 0,
      maxRegistrations: 50,
      eventType: 'Hoạt động khác',
      score: 50,
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

  List<volunteerActivities> filteredActivities(String name) {
    return _activity
        .where((activity) =>
            activity.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }
}
