
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../data/models/forget_password/forget_password_request.dart';
import '../../data/models/reset_password/reset_password_request.dart';
import '../../data/models/verify_password/verify_reset_code_request.dart';
import '../models/forget_password_model.dart';
import '../models/reset_password_model.dart';
import '../models/verifiy_reset_code_model.dart';
import '../repository/forget_password_repo_contract.dart';
@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;


  ForgetPasswordUseCase(this._forgetPasswordRepoContract);
  Future<BaseResponse<ForgetPasswordModel>>callForgetPassword(String email)
  {
    final request = ForgetPasswordRequest(email: email);
    return _forgetPasswordRepoContract.forgetPassword(request);
  }
  Future<BaseResponse<ResetPasswordModel>>callResetPassword(String email,String newPassword)
  {
    final request = ResetPasswordRequest(email: email, newPassword: newPassword);
    return _forgetPasswordRepoContract.resetPassword(request);


  }
  Future<BaseResponse<VerifyResetCodeModel>>callVerifyResetCode(String resetCode)
  {
    final request= VerifyResetCodeRequest(resetCode: resetCode);
    return _forgetPasswordRepoContract.verifyResetCode(request);

  }
}
