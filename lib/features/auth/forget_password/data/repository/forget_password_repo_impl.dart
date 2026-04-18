import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../domain/models/forget_password_entity.dart';
import '../../domain/models/reset_password_entity.dart';
import '../../domain/models/verifiy_reset_code_entity.dart';
import '../../domain/repository/forget_password_repo_contract.dart';
import '../data_sources/forget_password_data_source_contract.dart';
import '../models/forget_password/forget_password_request.dart';
import '../models/forget_password/forget_password_response.dart';
import '../models/reset_password/reset_password_request.dart';
import '../models/reset_password/reset_password_response.dart';
import '../models/verify_password/verify_reset_code_request.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImple implements ForgetPasswordRepoContract {
  final ForgetPasswordRemoteDataSourceContract _dataSource;

  ForgetPasswordRepoImple(this._dataSource);

  @override
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequest request,
  ) async {
    final response = await _dataSource.forgetPassword(request);

    return switch (response) {
      SuccessResponse<ForgetPasswordResponse>() => SuccessResponse(
        data: response.data.toModel(),
      ),
      ErrorResponse<ForgetPasswordResponse>() => ErrorResponse(
        errorMessage: response.errorMessage,
      ),
    };
  }

  @override
  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequest request,
  ) async {
    final response = await _dataSource.resetPassword(request);

    return switch (response) {
      SuccessResponse<ResetPasswordResponse>() => SuccessResponse(
        data: response.data.toModel(),
      ),
      ErrorResponse<ResetPasswordResponse>() => ErrorResponse(
        errorMessage: response.errorMessage,
      ),
    };
  }

  @override
  Future<BaseResponse<VerifiyResetCodeEntity>> verifyResetCode(
    VerifyResetCodeRequest request,
  ) async {
    final response = await _dataSource.verifyResetCode(request);
    return switch (response) {
      SuccessResponse() => SuccessResponse(data: response.data.toModel()),
      ErrorResponse() => ErrorResponse(errorMessage: response.errorMessage),
    };
  }
}
