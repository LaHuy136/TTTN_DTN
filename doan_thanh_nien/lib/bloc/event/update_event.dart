import 'package:equatable/equatable.dart';

abstract class UpdateEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateUserDataEvent extends UpdateEvent {
  final String? name;
  final String? phoneNumber;
  final String? dateOfBirth;
  final String? email;
  final String? studentId;

  UpdateUserDataEvent({
    this.name,
    this.phoneNumber,
    this.dateOfBirth,
    this.email,
    this.studentId,
  });

  

  @override
  List<Object> get props => [name!, phoneNumber!, dateOfBirth!, email!, studentId!];
}
