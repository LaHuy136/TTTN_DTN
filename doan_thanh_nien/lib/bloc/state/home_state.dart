import '../../helpers/volunteer_activities.dart';

class HomeState {
  final List<volunteerActivities> activities;
  final bool isLoading;

  HomeState({required this.activities, this.isLoading = false});

  HomeState copyWith({List<volunteerActivities>? activities, bool? isLoading}) {
    return HomeState(
      activities: activities ?? this.activities,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}