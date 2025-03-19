import 'package:intl/intl.dart';
import '../helpers/volunteer_activities.dart';

class Event {
  final int id;
  final String name;
  final String description;
  final DateTime date;
  final DateTime endDate;
  final DateTime registrationStartDate;
  final DateTime registrationEndDate;
  final Semester semester;
  final int userId;
  final int score;
  final int maxRegistrations;
  final int currentRegistrations;
  final String location;
  final String additionalInfo;
  final String eventType;
  final String? eventCriteria;
  final List<EventImage> eventImages;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.endDate,
    required this.registrationStartDate,
    required this.registrationEndDate,
    required this.semester,
    required this.userId,
    required this.score,
    required this.maxRegistrations,
    required this.currentRegistrations,
    required this.location,
    required this.additionalInfo,
    required this.eventType,
    this.eventCriteria,
    required this.eventImages,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      endDate: DateTime.parse(json['endDate']),
      registrationStartDate: DateTime.parse(json['registrationStartDate']),
      registrationEndDate: DateTime.parse(json['registrationEndDate']),
      semester: Semester.fromJson(json['semester']),
      userId: json['user_id'],
      score: json['score'],
      maxRegistrations: json['maxRegistrations'],
      currentRegistrations: json['currentRegistrations'],
      location: json['location'],
      additionalInfo: json['additionalInfo'],
      eventType: json['eventType'],
      eventCriteria: json['eventCriteria'],
      eventImages: (json['eventImage'] as List)
          .map((image) => EventImage.fromJson(image))
          .toList(),
    );
  }

  volunteerActivities toVolunteerActivity() {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return volunteerActivities(
      imagePath: eventImages.isNotEmpty ? eventImages.first.imageUrl : '',
      name: name,
      registrationStartDate: dateFormat.format(registrationStartDate),
      registrationEndDate: dateFormat.format(registrationEndDate),
      date: dateFormat.format(date),
      endDate: dateFormat.format(endDate),
      location: location,
      currentRegistrations: currentRegistrations,
      maxRegistrations: maxRegistrations,
      score: score,
      eventType: eventType,
      category: _getCategoryFromEventType(eventType),
      eventId: id,
    );
  }

  volunteerActivitiesCategory _getCategoryFromEventType(String eventType) {
    switch (eventType.toLowerCase()) {
      case 'truyền thống':
        return volunteerActivitiesCategory.traditional;
      case 'nghiên cứu':
        return volunteerActivitiesCategory.research;
      case 'đoàn':
        return volunteerActivitiesCategory.union;
      default:
        return volunteerActivitiesCategory.another;
    }
  }
}

class Semester {
  final int id;
  final String name;

  Semester({
    required this.id,
    required this.name,
  });

  factory Semester.fromJson(Map<String, dynamic> json) {
    return Semester(
      id: json['id'],
      name: json['name'],
    );
  }
}

class EventImage {
  final int id;
  final int eventId;
  final String imageUrl;

  EventImage({
    required this.id,
    required this.eventId,
    required this.imageUrl,
  });

  factory EventImage.fromJson(Map<String, dynamic> json) {
    return EventImage(
      id: json['id'],
      eventId: json['eventID'],
      imageUrl: json['imageUrl'],
    );
  }
} 