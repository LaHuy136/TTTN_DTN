// ignore_for_file: camel_case_types
import 'package:intl/intl.dart';

class volunteerActivities {
  final String imagePath;
  final String name;
  final String registrationStartDate;
  final String registrationEndDate;
  final String date;
  final String endDate;
  final String location;
  final int currentRegistrations;
  final int maxRegistrations;
  final int score;
  final String eventType;
  final bool isRegistered;
  final volunteerActivitiesCategory category;
  final int eventId;

  volunteerActivities({
    required this.imagePath,
    required this.name,
    required this.registrationStartDate,
    required this.registrationEndDate,
    required this.date,
    required this.endDate,
    required this.location,
    required this.currentRegistrations,
    required this.maxRegistrations,
    required this.eventType,
    required this.score,
    this.isRegistered = false,
    required this.category,
    required this.eventId,
  });

  factory volunteerActivities.fromJson(Map<String, dynamic> json) {
    return volunteerActivities(
      name: json['name'] ?? '',
      imagePath: json['imagePath'] ?? '',
      registrationStartDate: json['registrationStartDate'] ?? '',
      registrationEndDate: json['registrationEndDate'] ?? '',
      date: json['date'] ?? '',
      endDate: json['endDate'] ?? '',
      location: json['location'] ?? '',
      currentRegistrations: json['currentRegistrations'] ?? 0,
      maxRegistrations: json['maxRegistrations'] ?? 0,
      score: json['score'] ?? 0,
      eventType: json['eventType'] ?? '',
      isRegistered: json['isRegistered'] ?? false,
      category: volunteerActivitiesCategory.values[json['category']],
      eventId: json['eventId'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'name': name,
      'registrationStartDate': registrationStartDate,
      'registrationEndDate': registrationEndDate,
      'date': date,
      'endDate': endDate,
      'location': location,
      'currentRegistrations': currentRegistrations,
      'maxRegistrations': maxRegistrations,
      'eventType': eventType,
      'score': score,
      'isRegistered': isRegistered,
      'category': category.index,
      'eventId': eventId,
    };
  }

  volunteerActivities copyWith({
    String? imagePath,
    String? name,
    String? registrationStartDate,
    String? registrationEndDate,
    String? date,
    String? endDate,
    String? location,
    int? currentRegistrations,
    int? maxRegistrations,
    int? score,
    String? eventType,
    bool? isRegistered,
    volunteerActivitiesCategory? category,
    int? eventId,
  }) {
    return volunteerActivities(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      registrationStartDate:
          registrationStartDate ?? this.registrationStartDate,
      registrationEndDate: registrationEndDate ?? this.registrationEndDate,
      date: date ?? this.date,
      endDate: endDate ?? this.endDate,
      location: location ?? this.location,
      currentRegistrations: currentRegistrations ?? this.currentRegistrations,
      maxRegistrations: maxRegistrations ?? this.maxRegistrations,
      score: score ?? this.score,
      eventType: eventType ?? this.eventType,
      isRegistered: isRegistered ?? this.isRegistered,
      category: category ?? this.category,
      eventId: eventId ?? this.eventId,
    );
  }

  @override
  String toString() {
    return 'Name: $name, Date: $registrationStartDate, EndDate: $registrationEndDate, Location: $location, Category: $category';
  }

  int daysUntilExpiry() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final endDateParsed = dateFormat.parse(registrationEndDate);
    final now = DateTime.now();

    return endDateParsed.difference(now).inDays;
  }
}

enum volunteerActivitiesCategory {
  traditional,
  research,
  union,
  another,
}
