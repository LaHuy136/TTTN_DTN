import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();
  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpFailure extends SignUpState {}

class SignUpUpdated extends SignUpState {
  final String gender;
  const SignUpUpdated({required this.gender});
}

class SignUpFormUpdated extends SignUpState {
  final String name;
  final String password;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  const SignUpFormUpdated({
    required this.name,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
  });
  @override
  List<Object> get props =>
      [name, password, gender, dateOfBirth, faculty, studentId];
}
