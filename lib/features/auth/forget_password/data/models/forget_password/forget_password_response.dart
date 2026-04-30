import '../../../domain/models/forget_password_entity.dart';

class ForgetPasswordResponse {
  final String? message;
  final String? info;

  ForgetPasswordResponse({this.message, this.info});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponse(
        message: json['message'] as String?,
        info: json['info'] as String?,
      );

  ForgetPasswordEntity toModel() {
    return ForgetPasswordEntity(message: message ?? '', info: info);
  }
}
