import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../data/models/verify_password/verify_reset_code_request.dart';
import '../models/verifiy_reset_code_entity.dart';
import '../repository/forget_password_repo_contract.dart';

@injectable
class VerifyResetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  VerifyResetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<VerifiyResetCodeEntity>> callVerifyResetCode(
    VerifyResetCodeRequest request,
  ) {
    return _forgetPasswordRepoContract.verifyResetCode(request);
  }
}
