

class DrawerState {
  final String fullname;
  final String phoneNumber;
  final String dateOfBirth;
  final String email;
  final String studentId;

  DrawerState({
    this.fullname = '',
    this.phoneNumber = '',
    this.dateOfBirth = '',
    this.email = '',
    this.studentId = '',
  });

  DrawerState copyWith({
    String? fullname,
    String? phoneNumber,
    String? dateOfBirth,
    String? email,
    String? studentId,
  }) {
    return DrawerState(
      fullname: fullname ?? this.fullname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      studentId: studentId ?? this.studentId,
    );
  }
}