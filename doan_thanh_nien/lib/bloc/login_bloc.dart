// ignore_for_file: use_build_context_synchronously, unused_import

import 'package:doan_thanh_nien/bloc/event/signup_event.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event/login_event.dart' as login; 
import 'state/login_state.dart';
import '../pages/home_page.dart';
import '../services/auth_service.dart';

class LoginBloc extends Bloc<login.LoginEvent, LoginState> {
  final BuildContext context;
  final AuthService _authService = AuthService();

  LoginBloc(this.context) : super(LoginState()) {
    on<login.UserNameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<login.PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<login.LoginSubmitted>((event, emit) async {
      if (state.username.isEmpty || state.password.isEmpty) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Tên đăng nhập và mật khẩu không được để trống!',
        ));
        return;
      }

      emit(state.copyWith(isLoading: true, errorMessage: null));
      
      try {
        print('Attempting login with studentID: ${state.username}'); // Debug log
        
        final response = await _authService.login(
          state.username,
          state.password,
        );

        print('Login successful, saving user data'); // Debug log

        // Lưu thông tin đăng nhập
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['accessToken']);
        await prefs.setString('role', response['role']);
        await prefs.setString('username', response['userResponse'].username);
        await prefs.setString('fullname', response['userResponse'].fullname);
        await prefs.setString('phoneNumber', response['userResponse'].phoneNumber);
        await prefs.setString('dateOfBirth', response['userResponse'].dateOfBirth);
        await prefs.setString('email', response['userResponse'].email);
        await prefs.setString('studentId', response['userResponse'].studentId);

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
