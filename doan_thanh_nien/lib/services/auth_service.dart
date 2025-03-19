import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_response.dart';
import '../models/register_request.dart';

class AuthService {
  static const String baseUrl = 'https://servicescore-backend-1.onrender.com/api/v1'; // 

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      print('Calling login API with username: $username'); // Debug log
      
      final response = await http.post(
        Uri.parse('$baseUrl/users/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      print('Response status code: ${response.statusCode}'); // Debug log
      print('Response body: ${response.body}'); // Debug log

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['accessToken'] == null) {
          throw Exception('Token không hợp lệ');
        }
        
        return {
          'accessToken': responseData['accessToken'],
          'role': responseData['role'],
          'userResponse': UserResponse.fromJson(responseData['userResponse']),
        };
      } else {
        final errorData = json.decode(response.body);
        throw Exception(errorData['message'] ?? 'Đăng nhập thất bại');
      }
    } catch (e) {
      print('Login error: $e'); // Debug log
      throw Exception('Lỗi kết nối: $e');
    }
  }

  Future<void> register(RegisterRequest request) async {
    try {
      // print('Calling register API with data: ${request.toJson()}'); // Debug log
      
      final response = await http.post(
        Uri.parse('$baseUrl/users/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(request.toJson()),
      );

      print('Response status code: ${response.statusCode}'); // Debug log
      print('Response body: ${response.body}'); // Debug log

      if (response.statusCode != 200) {
        final errorData = json.decode(response.body);
        final errorMessage = errorData['message'] ?? 'Đăng ký thất bại';
        throw Exception(errorMessage);
      }
    } catch (e) {
      print('Register error: $e'); // Debug log
      if (e is Exception) {
        rethrow;
      }
      throw Exception('Lỗi kết nối: $e');
    }
  }

  // Kiểm tra xem có token không
  Future<bool> hasToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    print('Current token: $token'); // Debug log
    return token != null;
  }

  // Lấy token hiện tại
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // Xóa token (dùng cho logout)
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('role');
    await prefs.remove('studentId');
    await prefs.remove('fullname');
  }
}