import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String? name;
  final String? gender;
  final String? dateOfBirth;
  final String? faculty;
  final String? studentId;

  UpdateProfile({
    this.name,
    this.gender,
    this.dateOfBirth,
    this.faculty,
    this.studentId,
  });

  @override
  List<Object?> get props => [name, gender, dateOfBirth, faculty, studentId];
}
