import 'package:equatable/equatable.dart';
import '../../models/event.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object?> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<Event> events;
  final List<Event>? registeredEvents;
  const EventLoaded(this.events, {this.registeredEvents = const []});

  @override
  List<Object?> get props => [events, registeredEvents];
}

class EventError extends EventState {
  final String message;

  const EventError(this.message);

  @override
  List<Object?> get props => [message];
} 