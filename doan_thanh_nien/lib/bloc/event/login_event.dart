abstract class LoginEvent {}

class StudentIDChanged extends LoginEvent {
  final String studentID;
  StudentIDChanged(this.studentID);
}

class PasswordChanged extends LoginEvent {
  final String password;
  PasswordChanged(this.password);
}

class LoginSubmitted extends LoginEvent {}
