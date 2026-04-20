import 'package:exam_app/config/api/base_response.dart';

import '../../data/model/update_profile_request/update_profile_request.dart';
import '../model/update_profile_entity.dart';

abstract interface class UpdateProfileRepoContract {
  Future<BaseResponse<UpdateProfileEntity>> updateProfile(
      UpdateProfileRequest request);
}
