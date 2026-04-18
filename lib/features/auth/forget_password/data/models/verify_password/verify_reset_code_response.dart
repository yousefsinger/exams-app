import '../../../domain/models/verifiy_reset_code_model.dart';

class VerifyResetCodeResponse {
  final String? status;

  VerifyResetCodeResponse({this.status});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      VerifyResetCodeResponse(status: json['status'] as String?);

  VerifyResetCodeModel toModel() {
    return VerifyResetCodeModel(status: status ?? 'success');
  }
}
