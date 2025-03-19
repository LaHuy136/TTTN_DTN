import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/event_service.dart';
import './event/event_event.dart';
import './state/event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventService _eventService = EventService();

  EventBloc() : super(EventInitial()) {
    on<LoadEvents>((event, emit) async {
      emit(EventLoading());
      try {
        final events = await _eventService.getEvents(
          page: event.page,
          limit: event.limit,
        );
        emit(EventLoaded(events));
      } catch (e) {
        emit(EventError(e.toString()));
      }
    });
  }
} 