import '../../../domain/models/reset_password_entity.dart';

class ResetPasswordResponse {
  final String? token;
  final String? message;

  ResetPasswordResponse({this.token, this.message});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(
        token: json['token'] as String?,
        message: json['message'] as String?,
      );

  ResetPasswordEntity toModel() {
    return ResetPasswordEntity(token: token ?? '', message: message ?? '');
  }
}
