import '../../../../config/api/base_response.dart';
import '../model/change_password_request/change_password_request.dart';
import '../model/change_password_response/change_password_response.dart';
import '../model/update_profile_request/update_profile_request.dart';
import '../model/update_profile_response/update_profile_response.dart';
import '../model/user_response/user.dart';

abstract interface class ProfileRemoteDataSource {
  Future<BaseResponse<User>> getUser();

  Future<BaseResponse<UpdateProfileResponse>> updateProfile(
    UpdateProfileRequest request,
  );

  Future<BaseResponse<ChangePasswordResponse>> changePassword(
    ChangePasswordRequest request,
  );
}
