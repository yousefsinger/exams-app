import '../../../../config/api/base_response.dart';
import '../../data/model/change_password_request/change_password_request.dart';
import '../../data/model/update_profile_request/update_profile_request.dart';
import '../model/change_password_entity.dart';
import '../model/update_profile_entity.dart';
import '../model/user_entity.dart';

abstract interface class ProfileRepoContract {
  Future<BaseResponse<UserEntity>> getUser();

  Future<BaseResponse<UpdateProfileEntity>> updateProfile(
    UpdateProfileRequest request,
  );

  Future<BaseResponse<ChangePasswordEntity>> changePassword(
    ChangePasswordRequest request,
  );
}
