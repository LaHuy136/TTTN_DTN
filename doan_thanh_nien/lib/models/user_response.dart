class UserResponse {
  final int id;
  final String fullname;
  final String phoneNumber;
  final String studentId;
  final String address;
  final String dateOfBirth;
  final String email;
  final String username;
  final dynamic clazz;
  final bool attendances;
  final bool active;
  final dynamic department;

  UserResponse({
    required this.id,
    required this.fullname,
    required this.phoneNumber,
    required this.studentId,
    required this.address,
    required this.dateOfBirth,
    required this.email,
    required this.username,
    this.clazz,
    required this.attendances,
    required this.active,
    this.department,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] ?? 0,
      fullname: json['fullname'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      studentId: json['studentId'] ?? '',
      address: json['address'] ?? '',
      dateOfBirth: json['dateOfBirth'] ?? '',
      email: json['email'] ?? '',
      username: json['username'] ?? '',
      clazz: json['clazz'],
      attendances: json['attendances'] ?? false,
      active: json['active'] ?? false,
      department: json['department'],
    );
  }
}