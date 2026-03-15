import '../../data/model/user_dto.dart';

class LoginResponse {
  final String? message;
  final String? token;
  final UserDto? user;

  LoginResponse({this.message, this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] != null ? UserDto.fromJson(json['user']) : null,
    );
  }
}
