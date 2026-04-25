import 'package:exam_app/config/api/base_response.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/change_password_request/change_password_request.dart';
import '../model/change_password_entity.dart';
import '../repository/profile_repo_contract.dart';

@injectable
class ChangePasswordUseCase {
  final ProfileRepoContract _changePasswordRepo;

  const ChangePasswordUseCase(this._changePasswordRepo);

  Future<BaseResponse<ChangePasswordEntity>> call(
      ChangePasswordRequest request) {
    return _changePasswordRepo.changePassword(request);
  }
}
