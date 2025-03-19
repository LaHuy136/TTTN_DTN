import 'package:flutter_bloc/flutter_bloc.dart';
import 'event/signup_event.dart';
import 'state/signup_state.dart';
import '../services/auth_service.dart';
import '../models/register_request.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthService _authService = AuthService();

  SignUpBloc() : super(SignUpState()) {
    on<FullNameChanged>((event, emit) {
      emit(state.copyWith(fullName: event.fullName));
    });

    on<PhoneNumberChanged>((event, emit) {
      emit(state.copyWith(phoneNumber: event.phoneNumber));
    });

    on<StudentIdChanged>((event, emit) {
      emit(state.copyWith(studentId: event.studentId));
    });

    on<AddressChanged>((event, emit) {
      emit(state.copyWith(address: event.address));
    });

    on<DateOfBirthChanged>((event, emit) {
      emit(state.copyWith(dateOfBirth: event.dateOfBirth));
    });

    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<UsernameChanged>((event, emit) {
      emit(state.copyWith(username: event.username));
    });

    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<RetypePasswordChanged>((event, emit) {
      emit(state.copyWith(retypePassword: event.retypePassword));
    });

    on<ClassIdChanged>((event, emit) {
      emit(state.copyWith(classId: event.classId));
    });

    on<SignUpSubmitted>((event, emit) async {
      // print('Current state before submit:');
      // print('FullName: ${state.fullName}');
      // print('PhoneNumber: ${state.phoneNumber}');
      // print('StudentId: ${state.studentId}');
      // print('Address: ${state.address}');
      // print('DateOfBirth: ${state.dateOfBirth}');
      // print('Email: ${state.email}');
      // print('Username: ${state.username}');
      // print('Password: ${state.password}');
      // print('RetypePassword: ${state.retypePassword}');
      // print('ClassId: ${state.classId}');

      if (state.password != state.retypePassword) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: 'Mật khẩu xác nhận không khớp!',
        ));
        return;
      }

      emit(state.copyWith(isLoading: true, errorMessage: ''));

      try {
        final request = RegisterRequest(
          fullname: state.fullName,
          phoneNumber: state.phoneNumber,
          studentId: state.studentId,
          address: state.address,
          dateOfBirth: state.dateOfBirth,
          email: state.email,
          username: state.username,
          password: state.password,
          retypePassword: state.retypePassword,
          classId: state.classId,
          roleId: 'SV',
        );

        await _authService.register(request);
        
        final newState = state.copyWith(isLoading: false);
        emit(newState);
      } catch (e) {
        print('Registration failed: $e');
        emit(state.copyWith(
          isLoading: false,
          errorMessage: e.toString().replaceAll('Exception: ', ''),
        ));
      }
    });
  }
}
