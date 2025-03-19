import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/volunteer_activities.dart';
import 'event/activity_event.dart';
import 'state/activity_state.dart';
import 'dart:convert';

class ActivityDetailBloc
    extends Bloc<ActivityDetailEvent, ActivityDetailState> {
  ActivityDetailBloc() : super(ActivityDetailInitial()) {
    on<LoadActivityDetail>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      final registeredEventsJson = prefs.getString('registeredEvents');
      List<volunteerActivities> registeredEvents = [];
      int currentRegistrations = 0;
      int maxRegistrations = 0;

      if (registeredEventsJson != null) {
        registeredEvents = (json.decode(registeredEventsJson) as List)
            .map((e) => volunteerActivities.fromJson(e))
            .toList();
        currentRegistrations = registeredEvents
            .where((activity) => activity.name == event.name)
            .length;
      }

      emit(ActivityDetailLoaded(
        name: event.name,
        imagePath: event.imagePath,
        registrationStartDate: event.registrationStartDate,
        registrationEndDate: event.registrationEndDate,
        date: event.date,
        endDate: event.endDate,
        location: event.location,
        currentRegistrations: currentRegistrations,
        maxRegistrations: maxRegistrations,
        score: event.score,
        eventType: event.eventType,
        registeredEvents: registeredEvents,
        message:
            registeredEvents.isEmpty ? 'Chưa có sự kiện nào được đăng ký.' : '',
      ));
    });

    on<RegisterActivity>((event, emit) async {
      final state = this.state;
      if (state is ActivityDetailLoaded) {
        final isAlreadyRegistered =
            state.registeredEvents.any((e) => e.name == event.activity.name);

        if (isAlreadyRegistered) {
          emit(ActivityDetailLoaded(
            name: state.name,
            imagePath: state.imagePath,
            registrationStartDate: state.registrationStartDate,
            registrationEndDate: state.registrationEndDate,
            date: state.date,
            endDate: state.endDate,
            location: state.location,
            currentRegistrations: state.currentRegistrations,
            maxRegistrations: state.maxRegistrations,
            eventType: state.eventType,
            score: state.score,
            registeredEvents: state.registeredEvents,
            message: 'Hoạt động đã được đăng ký.',
          ));
        } else {
          final updatedEvents =
              List<volunteerActivities>.from(state.registeredEvents)
                ..add(event.activity.copyWith(isRegistered: true));

          final prefs = await SharedPreferences.getInstance();
          prefs.setString('registeredEvents',
              json.encode(updatedEvents.map((e) => e.toJson()).toList()));

          final newNumberRegistered = updatedEvents.length;

          emit(ActivityDetailLoaded(
            name: state.name,
            imagePath: state.imagePath,
            registrationStartDate: state.registrationStartDate,
            registrationEndDate: state.registrationEndDate,
            date: state.date,
            endDate: state.endDate,
            location: state.location,
            currentRegistrations: newNumberRegistered,
            maxRegistrations: state.maxRegistrations,
            eventType: state.eventType,
            score: state.score,
            registeredEvents: updatedEvents,
            message: 'Đăng ký thành công!',
          ));
        }
      }
    });
  }
}
