import '../../../../../config/api/base_response.dart';
import '../models/forget_password/forget_password_request.dart';
import '../models/forget_password/forget_password_response.dart';
import '../models/reset_password/reset_password_request.dart';
import '../models/reset_password/reset_password_response.dart';
import '../models/verify_password/verify_reset_code_request.dart';
import '../models/verify_password/verify_reset_code_response.dart';

abstract interface class ForgetPasswordRemoteDataSourceContract {
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
    ForgetPasswordRequest request,
  );

  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(
    VerifyResetCodeRequest request,
  );

  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
    ResetPasswordRequest request,
  );
}
