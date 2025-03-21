abstract class EventEvent {}

class LoadEvents extends EventEvent {
  final int page;
  final int limit;

  LoadEvents({this.page = 0, this.limit = 10});
} 
class LoadRegisteredEvents extends EventEvent {
  final String token;

  LoadRegisteredEvents(this.token);
}