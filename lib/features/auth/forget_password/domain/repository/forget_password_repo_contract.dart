import '../../../../../config/api/base_response.dart';
import '../../data/models/forget_password/forget_password_request.dart';
import '../../data/models/reset_password/reset_password_request.dart';
import '../../data/models/verify_password/verify_reset_code_request.dart';
import '../models/forget_password_entity.dart';
import '../models/reset_password_entity.dart';
import '../models/verifiy_reset_code_entity.dart';

abstract interface class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword(
    ForgetPasswordRequest request,
  );

  Future<BaseResponse<VerifiyResetCodeEntity>> verifyResetCode(
    VerifyResetCodeRequest request,
  );

  Future<BaseResponse<ResetPasswordEntity>> resetPassword(
    ResetPasswordRequest request,
  );
}
