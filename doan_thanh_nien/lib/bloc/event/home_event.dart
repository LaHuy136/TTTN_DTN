sealed class HomeEvent {}

class FetchActivitiesEvent extends HomeEvent {
  final String category;
  FetchActivitiesEvent({this.category = 'All'});
}
