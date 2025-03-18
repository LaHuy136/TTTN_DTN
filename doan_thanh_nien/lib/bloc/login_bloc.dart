// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event/login_event.dart';
import 'state/login_state.dart';
import '../pages/home_page.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BuildContext context;
  LoginBloc(this.context) : super(LoginState()) {
    on<StudentIDChanged>((event, emit) {
      emit(state.copyWith(studentID: event.studentID));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<LoginSubmitted>((event, emit) async {
      if (state.studentID.isEmpty || state.password.isEmpty) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Mã sinh viên và mật khẩu không được để trống!',
        ));
        return;
      }

      emit(state.copyWith(isLoading: true, errorMessage: null));
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String storedStudentID = prefs.getString('studentId') ?? '';
      String storedPassword = prefs.getString('password') ?? '';
      
      if (state.studentID == storedStudentID &&
          state.password == storedPassword) {
        emit(state.copyWith(isLoading: false));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(selectedCategory: 'All'),
          ),
        );
      } else {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Mã sinh viên hoặc mật khẩu không chính xác!',
        ));
      }
    });
  }
}
