import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event/profile_event.dart';
import 'state/profle_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SharedPreferences prefs;

  ProfileBloc({required this.prefs}) : super(ProfileState.initial()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    String name = prefs.getString('fullname') ?? '';
    String phoneNumber = prefs.getString('phoneNumber') ?? '';
    String dateOfBirth = prefs.getString('dateOfBirth') ?? '';
    String email = prefs.getString('email') ?? '';
    String studentId = prefs.getString('studentId') ?? '';

    emit(state.copyWith(
      name: name,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth,
      email: email,
      studentId: studentId,
    ));
  }

  Future<void> _onUpdateProfile(
      UpdateProfile event, Emitter<ProfileState> emit) async {
    if (event.dateOfBirth != null) {
      await prefs.setString('dateOfBirth', event.dateOfBirth!);
    }

    emit(state.copyWith(
      name: event.name ?? state.name,
      phoneNumber: event.phoneNumber ?? state.phoneNumber,
      dateOfBirth: event.dateOfBirth ?? state.dateOfBirth,
      email: event.email ?? state.email,
      studentId: event.studentId ?? state.studentId,
    ));
  }
}
