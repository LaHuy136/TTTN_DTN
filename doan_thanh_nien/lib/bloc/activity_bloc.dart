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
      int numberRegistered = 0;

      if (registeredEventsJson != null) {
        registeredEvents = (json.decode(registeredEventsJson) as List)
            .map((e) => volunteerActivities.fromJson(e))
            .toList();
        numberRegistered = registeredEvents
            .where((activity) => activity.title == event.title)
            .length;
      }

      emit(ActivityDetailLoaded(
        title: event.title,
        imagePath: event.imagePath,
        day: event.day,
        location: event.location,
        numberRegistered: numberRegistered,
        registeredEvents: registeredEvents,
        message: registeredEvents.isEmpty
            ? 'Chưa có sự kiện nào được đăng ký.'
            : '', 
      ));
    });

    on<RegisterActivity>((event, emit) async {
      final state = this.state;
      if (state is ActivityDetailLoaded) {
        final isAlreadyRegistered =
            state.registeredEvents.any((e) => e.title == event.activity.title);

        if (isAlreadyRegistered) {
          emit(ActivityDetailLoaded(
            title: state.title,
            imagePath: state.imagePath,
            day: state.day,
            location: state.location,
            numberRegistered: state.numberRegistered,
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

          final newNumberRegistered = updatedEvents
              .length; 

          emit(ActivityDetailLoaded(
            title: state.title,
            imagePath: state.imagePath,
            day: state.day,
            location: state.location,
            numberRegistered: newNumberRegistered,
            registeredEvents: updatedEvents,
            message: 'Đăng ký thành công!',
          ));
        }
      }
    });
  }
}
