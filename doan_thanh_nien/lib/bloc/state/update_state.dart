import 'package:equatable/equatable.dart';

abstract class UpdateState extends Equatable {
  final String? nameError;
  final String? phoneNumberError;
  final String? dateOfBirthError;
  final String? emailError;
  final String? studentIdError;

  const UpdateState({
    this.nameError,
    this.phoneNumberError,
    this.dateOfBirthError,
    this.emailError,
    this.studentIdError,
  });

  @override
  List<Object?> get props =>
      [nameError, phoneNumberError, dateOfBirthError, emailError, studentIdError];
}

class UpdateInitial extends UpdateState {}

class UpdateLoaded extends UpdateState {
  final String name;
  final String phoneNumber;
  final String dateOfBirth;
  final String email;
  final String studentId;

  const UpdateLoaded({
    required this.name,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.email,
    required this.studentId,
    super.nameError,
    super.phoneNumberError,
    super.dateOfBirthError,
    super.emailError,
    super.studentIdError,
  });

  @override
  List<Object?> get props => [
        name,
        phoneNumber,
        dateOfBirth,
        email,
        studentId,
        nameError,
        phoneNumberError,
        dateOfBirthError,
        emailError,
        studentIdError
      ];
}

class UpdateSuccess extends UpdateState {}

class UpdateFailure extends UpdateState {
  final String? errorMessage;

  const UpdateFailure({
    this.errorMessage,
    super.nameError,
    super.phoneNumberError,
    super.dateOfBirthError,
    super.emailError,
    super.studentIdError,
  });

  @override
  List<Object?> get props => [
        errorMessage ?? '',
        nameError ?? '',
        phoneNumberError ?? '',
        dateOfBirthError ?? '',
        emailError ?? '',
        studentIdError ?? ''
      ];
}
