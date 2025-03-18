import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object> get props => [];
}

class NameChanged extends SignUpEvent {
  final String name;
  const NameChanged(this.name);
  @override
  List<Object> get props => [name];
}

class PasswordChanged extends SignUpEvent {
  final String password;
  const PasswordChanged(this.password);
  @override
  List<Object> get props => [password];
}

class GenderChanged extends SignUpEvent {
  final String gender;
  const GenderChanged(this.gender);
  @override
  List<Object> get props => [gender];
}

class DateOfBirthChanged extends SignUpEvent {
  final String dateOfBirth;
  const DateOfBirthChanged(this.dateOfBirth);
  @override
  List<Object> get props => [dateOfBirth];
}

class FacultyChanged extends SignUpEvent {
  final String faculty;
  const FacultyChanged(this.faculty);
  @override
  List<Object> get props => [faculty];
}

class StudentIdChanged extends SignUpEvent {
  final String studentId;
  const StudentIdChanged(this.studentId);
  @override
  List<Object> get props => [studentId];
}

class SignUpSubmitted extends SignUpEvent {
  final String name;
  final String password;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;
  
  const SignUpSubmitted({
    required this.name,
    required this.password,
    required this.gender,
    required this.dateOfBirth,
    required this.faculty,
    required this.studentId,
  });
  
  @override
  List<Object> get props => [name, password, gender, dateOfBirth, faculty, studentId];
}