import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'event/drawer_event.dart';
import 'state/drawer_state.dart';


class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerState()) {
    on<LoadUserDataEvent>(_onLoadUserData);
  }

  void _onLoadUserData(LoadUserDataEvent event, Emitter<DrawerState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(state.copyWith(
      name: prefs.getString('name') ?? '',
      gender: prefs.getString('gender') ?? '',
      dateOfBirth: prefs.getString('dateOfBirth') ?? '',
      faculty: prefs.getString('faculty') ?? '',
      studentId: prefs.getString('studentId') ?? '',
    ));
  }
}
