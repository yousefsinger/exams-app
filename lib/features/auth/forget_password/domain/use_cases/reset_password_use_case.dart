import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../data/models/reset_password/reset_password_request.dart';
import '../models/reset_password_entity.dart';
import '../repository/forget_password_repo_contract.dart';

@injectable
class ResetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  ResetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<ResetPasswordEntity>> callResetPassword(
      ResetPasswordRequest request) {
    return _forgetPasswordRepoContract.resetPassword(request);
  }
}
