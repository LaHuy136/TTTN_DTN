// ignore_for_file: camel_case_types
import 'package:intl/intl.dart';
class volunteerActivities {
  final String imagePath;
  final String title;
  final String day;
  final String location;
  final int registeredNumber;
  final bool isRegistered;
  final volunteerActivitiesCategory category;

  volunteerActivities({
    required this.imagePath,
    required this.title,
    required this.day,
    required this.location,
    required this.registeredNumber,
    this.isRegistered = false,
    required this.category,
  });

  factory volunteerActivities.fromJson(Map<String, dynamic> json) {
    return volunteerActivities(
      imagePath: json['imagePath'] ?? '',
      title: json['title'] ?? '',
      day: json['day'] ?? '',
      location: json['location'] ?? '',
      registeredNumber: json['registeredNumber'] ?? 0,
      isRegistered: json['isRegistered'] ?? false,
      category: volunteerActivitiesCategory.values[json['category']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'title': title,
      'day': day,
      'location': location,
      'registeredNumber': registeredNumber,
      'isRegistered': isRegistered,
      'category': category.index,
    };
  }

  volunteerActivities copyWith({
    String? imagePath,
    String? title,
    String? day,
    String? location,
    int? registeredNumber,
    bool? isRegistered,
    volunteerActivitiesCategory? category,
  }) {
    return volunteerActivities(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      day: day ?? this.day,
      location: location ?? this.location,
      registeredNumber: registeredNumber ?? this.registeredNumber,
      isRegistered: isRegistered ?? this.isRegistered,
      category: category ?? this.category,
    );
  }

  @override
  String toString() {
    return 'Title: $title, Day: $day, Location: $location, Category: $category';
  }

  bool isExpired() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final dates = day.split(' - ');
    final endDate = dateFormat.parse(dates[1]);
    return DateTime.now().isAfter(endDate);
  }
}

enum volunteerActivitiesCategory {
  traditional,
  research,
  union,
  another,
}
