import 'package:equatable/equatable.dart';

import '../../helpers/volunteer_activities.dart';

class ActivityDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadActivityDetail extends ActivityDetailEvent {
  final String name;
  final String imagePath;
  final String registrationStartDate;
  final String registrationEndDate;
  final String date;
  final String endDate;
  final String location;
  final int? currentRegistrations;
  final int? maxRegistrations;
  final int score;
  final String eventType;

  LoadActivityDetail({
    required this.name,
    required this.imagePath,
    required this.registrationStartDate,
    required this.registrationEndDate,
    required this.date,
    required this.endDate,
    required this.location,
    required this.eventType,
    required this.score,
    this.currentRegistrations,
    this.maxRegistrations
  });

  @override
  List<Object?> get props => [name, imagePath, registrationStartDate, registrationEndDate, location, currentRegistrations, maxRegistrations];
}

class RegisterActivity extends ActivityDetailEvent {
  final volunteerActivities activity;

  RegisterActivity({required this.activity});
}
