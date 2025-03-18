import 'package:flutter_bloc/flutter_bloc.dart';
import 'event/signup_event.dart';
import 'state/signup_state.dart';
import '../helpers/save_user_profile.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  String name = '';
  String password = '';
  String gender = '';
  String dateOfBirth = '';
  String faculty = '';
  String studentId = '';

  SignUpBloc() : super(SignUpInitial()) {
    on<NameChanged>((event, emit) {
      name = event.name;
      emit(SignUpFormUpdated(
        name: name,
        password: password,
        gender: gender,
        dateOfBirth: dateOfBirth,
        faculty: faculty,
        studentId: studentId,
      ));
    });

    on<PasswordChanged>((event, emit) {
      password = event.password;
      emit(SignUpFormUpdated(
        name: name,
        password: password,
        gender: gender,
        dateOfBirth: dateOfBirth,
        faculty: faculty,
        studentId: studentId,
      ));
    });

    on<GenderChanged>((event, emit) {
      gender = event.gender;
      emit(SignUpFormUpdated(
        name: name,
        password: password,
        gender: gender,
        dateOfBirth: dateOfBirth,
        faculty: faculty,
        studentId: studentId,
      ));
    });

    on<DateOfBirthChanged>((event, emit) {
      dateOfBirth = event.dateOfBirth;
      emit(SignUpFormUpdated(
        name: name,
        password: password,
        gender: gender,
        dateOfBirth: dateOfBirth,
        faculty: faculty,
        studentId: studentId,
      ));
    });

    on<FacultyChanged>((event, emit) {
      faculty = event.faculty;
      emit(SignUpFormUpdated(
        name: name,
        password: password,
        gender: gender,
        dateOfBirth: dateOfBirth,
        faculty: faculty,
        studentId: studentId,
      ));
    });

    on<StudentIdChanged>((event, emit) {
      studentId = event.studentId;
      emit(SignUpFormUpdated(
        name: name,
        password: password,
        gender: gender,
        dateOfBirth: dateOfBirth,
        faculty: faculty,
        studentId: studentId,
      ));
    });

    on<SignUpSubmitted>((event, emit) async {
      if (event.name.isEmpty ||
          event.password.isEmpty ||
          event.gender.isEmpty ||
          event.dateOfBirth.isEmpty ||
          event.faculty.isEmpty ||
          event.studentId.isEmpty) {
        emit(SignUpFailure());
        return;
      }

      if (event.password.length < 6) {
        emit(SignUpFailure());
        return;
      }

      if (!RegExp(r'^10221\d{4}$').hasMatch(event.studentId)) {
        emit(SignUpFailure());
        return;
      }

      emit(SignUpLoading());
      try {
        await saveUserProfile(
          name: event.name,
          password: event.password,
          gender: event.gender,
          dateOfBirth: event.dateOfBirth,
          faculty: event.faculty,
          studentId: event.studentId,
        );
        emit(SignUpSuccess());
      } catch (_) {
        emit(SignUpFailure());
      }
    });
  }
}
