class ProfileState {
  final String name;
  final String phoneNumber;
  final String dateOfBirth;
  final String email;
  final String studentId;

  ProfileState({
    required this.name,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.email,
    required this.studentId,
  });

  factory ProfileState.initial() {
    return ProfileState(
      name: '',
      phoneNumber: '',
      dateOfBirth: '',
      email: '',
      studentId: '',
    );
  }

  ProfileState copyWith({
    String? name,
    String? phoneNumber,
    String? dateOfBirth,
    String? email,
    String? studentId,
  }) {
    return ProfileState(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      studentId: studentId ?? this.studentId,
    );
  }
}
