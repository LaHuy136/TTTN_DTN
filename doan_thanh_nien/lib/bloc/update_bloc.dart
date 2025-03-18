import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'event/update_event.dart';
import 'state/update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(UpdateInitial()) {
    on<UpdateUserDataEvent>((event, emit) async {
      String? nameError;
      String? genderError;
      String? dateOfBirthError;
      String? facultyError;
      String? studentIdError;

      if (event.name!.isEmpty) {
        nameError = "Tên không được để trống";
      } else if (event.name!.length > 30) {
        nameError = "Tên quá dài";
      }

      if (event.gender!.isEmpty) {
        genderError = "Giới tính không được để trống";
      }

      if (event.dateOfBirth == null) {
        dateOfBirthError = "Ngày sinh không được để trống";
      }

      if (event.faculty!.isEmpty) {
        facultyError = "Khoa không được để trống";
      }

      if (event.studentId!.isEmpty) {
        studentIdError = "Mã sinh viên không được để trống";
      } else if (!RegExp(r'^10221\d{4}$').hasMatch(event.studentId!)) {
        studentIdError = "Mã sinh viên không hợp lệ";
      }

      if (nameError != null ||
          genderError != null ||
          dateOfBirthError != null ||
          facultyError != null ||
          studentIdError != null) {
        emit(UpdateFailure(
          nameError: nameError,
          genderError: genderError,
          dateOfBirthError: dateOfBirthError,
          facultyError: facultyError,
          studentIdError: studentIdError,
        ));
        return;
      }
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('name', event.name!);
        await prefs.setString('gender', event.gender!);
        await prefs.setString('dateOfBirth', event.dateOfBirth!);
        await prefs.setString('faculty', event.faculty!);
        await prefs.setString('studentId', event.studentId!);

        emit(UpdateSuccess());
        emit(UpdateLoaded(
          name: event.name!,
          gender: event.gender!,
          dateOfBirth: event.dateOfBirth!,
          faculty: event.faculty!,
          studentId: event.studentId!,
        ));
      } catch (e) {
        emit(const UpdateFailure(errorMessage: "Lỗi khi cập nhật dữ liệu"));
      }
    });
  }
}
