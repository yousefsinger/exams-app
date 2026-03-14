import '../../../../../config/api/base_response.dart';
import '../../data/models/forget_password/forget_password_request.dart';
import '../../data/models/reset_password/reset_password_request.dart';
import '../../data/models/verify_password/verify_reset_code_request.dart';
import '../models/forget_password_model.dart';
import '../models/reset_password_model.dart';
import '../models/verifiy_reset_code_model.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordModel>> forgetPassword(
      ForgetPasswordRequest request,
      );
  Future<BaseResponse<VerifyResetCodeModel>> verifyResetCode(
      VerifyResetCodeRequest request,
      );
  Future<BaseResponse<ResetPasswordModel>> resetPassword(
      ResetPasswordRequest request,
      );
}