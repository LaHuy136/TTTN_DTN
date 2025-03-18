import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String fullName;
  final String phoneNumber;
  final String studentId;
  final String address;
  final String dateOfBirth;
  final String email;
  final String username;
  final String password;
  final String retypePassword;
  final String classId;
  final bool isLoading;
  final String? errorMessage;
  final bool isSuccess;

  const SignUpState({
    this.fullName = '',
    this.phoneNumber = '',
    this.studentId = '',
    this.address = '',
    this.dateOfBirth = '',
    this.email = '',
    this.username = '',
    this.password = '',
    this.retypePassword = '',
    this.classId = '',
    this.isLoading = false,
    this.errorMessage,
    this.isSuccess = false,
  });

  SignUpState copyWith({
    String? fullName,
    String? phoneNumber,
    String? studentId,
    String? address,
    String? dateOfBirth,
    String? email,
    String? username,
    String? password,
    String? retypePassword,
    String? classId,
    bool? isLoading,
    Object? errorMessage = const Object(),
    bool? isSuccess,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      studentId: studentId ?? this.studentId,
      address: address ?? this.address,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      username: username ?? this.username,
      password: password ?? this.password,
      retypePassword: retypePassword ?? this.retypePassword,
      classId: classId ?? this.classId,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage == const Object() ? this.errorMessage : errorMessage as String?,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object?> get props => [
        fullName,
        phoneNumber,
        studentId,
        address,
        dateOfBirth,
        email,
        username,
        password,
        retypePassword,
        classId,
        isLoading,
        errorMessage,
        isSuccess,
      ];
}
