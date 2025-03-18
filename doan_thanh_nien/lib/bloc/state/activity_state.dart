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
  final String title;
  final String imagePath;
  final String day;
  final String location;
  final int numberRegistered;
  final String message;
  

  const ActivityDetailLoaded({
    required this.title,
    required this.imagePath,
    required this.day,
    required this.location,
    required this.message,
    required this.numberRegistered,
    List<volunteerActivities>? registeredEvents,
  }) : super(registeredEvents: registeredEvents ?? const []);
}
