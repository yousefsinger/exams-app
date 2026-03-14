
import '../../../domain/models/forget_password_model.dart';

class ForgetPasswordResponse {
  final String? message;
  final String? info;

  ForgetPasswordResponse({
    this.message,
    this.info,
  });

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponse(
        message: json['message'] as String?,
        info: json['info'] as String?,
      );
  ForgetPasswordModel toModel() {
    return ForgetPasswordModel(
      message: message ?? '',
      info: info,
    );
  }
}