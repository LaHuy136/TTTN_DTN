import 'user_response.dart';

class LoginResponse {
  final String accessToken;
  final String role;
  final UserResponse userResponse;

  LoginResponse({
    required this.accessToken,
    required this.role,
    required this.userResponse,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json['accessToken'] ?? '',
      role: json['role'] ?? '',
      userResponse: UserResponse.fromJson(json['userResponse'] ?? {}),
    );
  }
}