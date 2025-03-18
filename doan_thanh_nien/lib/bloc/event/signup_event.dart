abstract class SignUpEvent {}

class FullNameChanged extends SignUpEvent {
  final String fullName;
  FullNameChanged(this.fullName);
}

class PhoneNumberChanged extends SignUpEvent {
  final String phoneNumber;
  PhoneNumberChanged(this.phoneNumber);
}

class StudentIdChanged extends SignUpEvent {
  final String studentId;
  StudentIdChanged(this.studentId);
}

class AddressChanged extends SignUpEvent {
  final String address;
  AddressChanged(this.address);
}

class DateOfBirthChanged extends SignUpEvent {
  final String dateOfBirth;
  DateOfBirthChanged(this.dateOfBirth);
}

class EmailChanged extends SignUpEvent {
  final String email;
  EmailChanged(this.email);
}

class UsernameChanged extends SignUpEvent {
  final String username;
  UsernameChanged(this.username);
}

class PasswordChanged extends SignUpEvent {
  final String password;
  PasswordChanged(this.password);
}

class RetypePasswordChanged extends SignUpEvent {
  final String retypePassword;
  RetypePasswordChanged(this.retypePassword);
}

class ClassIdChanged extends SignUpEvent {
  final String classId;
  ClassIdChanged(this.classId);
}

class SignUpSubmitted extends SignUpEvent {}