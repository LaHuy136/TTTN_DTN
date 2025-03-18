

class DrawerState {
  final String name;
  final String gender;
  final String dateOfBirth;
  final String faculty;
  final String studentId;

  DrawerState({
    this.name = '',
    this.gender = '',
    this.dateOfBirth = '',
    this.faculty = '',
    this.studentId = '',
  });

  DrawerState copyWith({
    String? name,
    String? gender,
    String? dateOfBirth,
    String? faculty,
    String? studentId,
  }) {
    return DrawerState(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      faculty: faculty ?? this.faculty,
      studentId: studentId ?? this.studentId,
    );
  }
}