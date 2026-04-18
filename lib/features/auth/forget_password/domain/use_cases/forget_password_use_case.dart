import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../data/models/forget_password/forget_password_request.dart';
import '../models/forget_password_entity.dart';
import '../repository/forget_password_repo_contract.dart';

@injectable
class ForgetPasswordUseCase {
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  ForgetPasswordUseCase(this._forgetPasswordRepoContract);

  Future<BaseResponse<ForgetPasswordEntity>> callForgetPassword(String email) {
    final request = ForgetPasswordRequest(email: email);
    return _forgetPasswordRepoContract.forgetPassword(request);
  }
}
