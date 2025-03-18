import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserProfile({
  required String name,
  required String password,
  required String gender,
  required String dateOfBirth,
  required String faculty,
  required String studentId,
}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
  await prefs.setString('password', password);
  await prefs.setString('gender', gender);
  await prefs.setString('dateOfBirth', dateOfBirth);
  await prefs.setString('faculty', faculty);
  await prefs.setString('studentId', studentId);
}