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
      fullname: prefs.getString('fullname') ?? '',
      phoneNumber: prefs.getString('phoneNumber') ?? '',
      dateOfBirth: prefs.getString('dateOfBirth') ?? '',
      email: prefs.getString('email') ?? '',
      studentId: prefs.getString('studentId') ?? '',
    ));
  }
}
