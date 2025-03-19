import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProfile extends ProfileEvent {}

class UpdateProfile extends ProfileEvent {
  final String? name;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? email;
  final String? studentId;

  UpdateProfile({
    this.name,
    this.phoneNumber,
    this.dateOfBirth,
    this.email,
    this.studentId,
  });

  @override
  List<Object?> get props => [name, phoneNumber, dateOfBirth, email, studentId];
}
