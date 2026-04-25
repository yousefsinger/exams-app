import 'package:dio/dio.dart';
import 'package:exam_app/core/values/api_constants.dart';
import 'package:exam_app/features/profile/data/model/change_password_response/change_password_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../data/model/change_password_request/change_password_request.dart';
import '../../data/model/update_profile_request/update_profile_request.dart';
import '../../data/model/update_profile_response/update_profile_response.dart';
import '../../data/model/user_response/user_response.dart';

part 'profile_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;
  @GET(ApiConstants.getUserData)
  Future<UserResponse> getUserData();
  @PUT(ApiConstants.updateProfile)
  Future<UpdateProfileResponse> updateProfile(
      @Body() UpdateProfileRequest request);

  @PATCH(ApiConstants.changePasswordProfile)
  Future<ChangePasswordResponse> changePassword(
      @Body() ChangePasswordRequest request);
}
