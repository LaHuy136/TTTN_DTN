class RegisterRequest {
  final String fullname;
  final String phoneNumber;
  final String studentId;
  final String address;
  final String dateOfBirth;
  final String email;
  final String username;
  final String password;
  final String retypePassword;
  final String classId;
  final String roleId;

  RegisterRequest({
    required this.fullname,
    required this.phoneNumber,
    required this.studentId,
    required this.address,
    required this.dateOfBirth,
    required this.email,
    required this.username,
    required this.password,
    required this.retypePassword,
    required this.classId,
    required this.roleId,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullname,
      'phone_number': phoneNumber,
      'student_id': studentId,
      'address': address,
      'date_of_birth': dateOfBirth,
      'email': email,
      'username': username,
      'password': password,
      'retype_password': retypePassword,
      'class_id': classId,
      'role_id': roleId,
    };
  }
} 