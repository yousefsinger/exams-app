import 'package:exam_app/features/profile/domain/model/change_password_entity.dart';

import '../../../../config/api/base_response.dart';
import '../../data/model/change_password_request/change_password_request.dart';

abstract interface class ChangePasswordRepoContract {
  Future<BaseResponse<ChangePasswordEntity>> changePassword(
      ChangePasswordRequest request);
}
