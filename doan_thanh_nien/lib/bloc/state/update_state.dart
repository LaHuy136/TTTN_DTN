import 'package:equatable/equatable.dart';

abstract class UpdateState extends Equatable {
  final String? nameError;
  final String? genderError;
  final String? dateOfBirthError;
  final String? facultyError;
  final String? studentIdError;

  const UpdateState({
    this.nameError,
    this.genderError,
    this.dateOfBirthError,
    this.facultyError,
    this.studentIdError,
  });

  @override
  List<Object?> get props =>
      [nameError, genderError, dateOfBirthError, facultyError, studentIdError];
}

class UpdateInitial extends UpdateState {}

class UpdateLoaded extends UpdateState {
  final String name;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  const UpdateLoaded({
    required this.name,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
    super.nameError,
    super.genderError,
    super.dateOfBirthError,
    super.facultyError,
    super.studentIdError,
  });

  @override
  List<Object?> get props => [
        name,
        gender,
        dateOfBirth,
        faculty,
        studentId,
        nameError,
        genderError,
        dateOfBirthError,
        facultyError,
        studentIdError
      ];
}

class UpdateSuccess extends UpdateState {}

class UpdateFailure extends UpdateState {
  final String? errorMessage;

  const UpdateFailure({
    this.errorMessage,
    super.nameError,
    super.genderError,
    super.dateOfBirthError,
    super.facultyError,
    super.studentIdError,
  });

  @override
  List<Object?> get props => [
        errorMessage ?? '',
        nameError ?? '',
        genderError ?? '',
        dateOfBirthError ?? '',
        facultyError ?? '',
        studentIdError ?? ''
      ];
}
