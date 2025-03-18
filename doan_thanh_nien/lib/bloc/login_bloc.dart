// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event/login_event.dart';
import 'state/login_state.dart';
import '../pages/home_page.dart';
import '../services/auth_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final BuildContext context;
  final AuthService _authService = AuthService();

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
          errorMessage: 'Mã sinh viên và mật khẩu không được để trống!',
        ));
        return;
      }

      emit(state.copyWith(isLoading: true, errorMessage: null));
      
      try {
        print('Attempting login with studentID: ${state.studentID}'); // Debug log
        
        final response = await _authService.login(
          state.studentID,
          state.password,
        );

        print('Login successful, saving user data'); // Debug log

        // Lưu thông tin đăng nhập
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['accessToken']);
        await prefs.setString('role', response['role']);
        await prefs.setString('studentId', response['userResponse'].studentId);
        await prefs.setString('fullname', response['userResponse'].fullname);
        await prefs.setString('dateOfBirth', response['userResponse'].dateOfBirth);

        print('User data saved successfully'); // Debug log

        emit(state.copyWith(isLoading: false));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(selectedCategory: 'All'),
          ),
        );
      } catch (e) {
        print('Login error in bloc: $e'); // Debug log
        emit(state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceAll('Exception: ', ''),
        ));
      }
    });
  }
}
