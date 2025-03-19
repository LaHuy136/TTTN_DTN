import 'package:equatable/equatable.dart';

import '../../helpers/volunteer_activities.dart';

class ActivityDetailState extends Equatable {
  final List<volunteerActivities> registeredEvents;

  const ActivityDetailState({this.registeredEvents = const []});

  @override
  List<Object> get props => [registeredEvents];
}

class ActivityDetailInitial extends ActivityDetailState {}

class ActivityDetailLoaded extends ActivityDetailState {
  final String name;
  final String imagePath;
  final String date;
  final String endDate;
  final String location;
  final int currentRegistrations;
  final int maxRegistrations;
  final String registrationStartDate;
  final String registrationEndDate;
  final int score;
  final String eventType;
  final String message;
  

  const ActivityDetailLoaded({
    required this.name,
    required this.imagePath,
    required this.date,
    required this.endDate,
    required this.location,
    required this.message,
    required this.currentRegistrations,
    required this.maxRegistrations,
    required this.registrationStartDate,
    required this.registrationEndDate,
    required this.score,
    required this.eventType,
    List<volunteerActivities>? registeredEvents,
  }) : super(registeredEvents: registeredEvents ?? const []);
}
