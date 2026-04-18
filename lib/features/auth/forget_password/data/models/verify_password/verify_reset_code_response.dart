import '../../../domain/models/verifiy_reset_code_entity.dart';

class VerifyResetCodeResponse {
  final String? status;

  VerifyResetCodeResponse({this.status});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      VerifyResetCodeResponse(status: json['status'] as String?);

  VerifiyResetCodeEntity toModel() {
    return VerifiyResetCodeEntity(status: status ?? 'success');
  }
}
