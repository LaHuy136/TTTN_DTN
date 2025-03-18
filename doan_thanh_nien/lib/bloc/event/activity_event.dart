import 'package:equatable/equatable.dart';

import '../../helpers/volunteer_activities.dart';

class ActivityDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadActivityDetail extends ActivityDetailEvent {
  final String title;
  final String imagePath;
  final String day;
  final String location;
  final int? registeredNumber;

  LoadActivityDetail({
    required this.title,
    required this.imagePath,
    required this.day,
    required this.location,
    this.registeredNumber,
  });

  @override
  List<Object?> get props => [title, imagePath, day, location, registeredNumber];
}

class RegisterActivity extends ActivityDetailEvent {
  final volunteerActivities activity;

  RegisterActivity({required this.activity});
}
