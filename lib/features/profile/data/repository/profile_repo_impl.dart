import 'package:injectable/injectable.dart';

import '../../../../config/api/base_response.dart';
import '../../domain/model/change_password_entity.dart';
import '../../domain/model/update_profile_entity.dart';
import '../../domain/model/user_entity.dart';
import '../../domain/repository/profile_repo_contract.dart';
import '../data_sources/profile_remote_data_source_contract.dart';
import '../model/change_password_request/change_password_request.dart';
import '../model/change_password_response/change_password_response.dart';
import '../model/update_profile_request/update_profile_request.dart';
import '../model/update_profile_response/update_profile_response.dart';
import '../model/user_response/user.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  final ProfileRemoteDataSource _dataSource;

  ProfileRepoImpl(this._dataSource);

  @override
  Future<BaseResponse<UserEntity>> getUser() async {
    final response = await _dataSource.getUser();

    return switch (response) {
      SuccessResponse<User>() => SuccessResponse(
          data: response.data.toDomain(),
        ),
      ErrorResponse<User>() => ErrorResponse(
          errorMessage: response.errorMessage,
        ),
    };
  }

  @override
  Future<BaseResponse<UpdateProfileEntity>> updateProfile(
    UpdateProfileRequest request,
  ) async {
    final response = await _dataSource.updateProfile(request);

    return switch (response) {
      SuccessResponse<UpdateProfileResponse>() => SuccessResponse(
          data: response.data.toDomain(),
        ),
      ErrorResponse<UpdateProfileResponse>() => ErrorResponse(
          errorMessage: response.errorMessage,
        ),
    };
  }

  @override
  Future<BaseResponse<ChangePasswordEntity>> changePassword(
    ChangePasswordRequest request,
  ) async {
    final response = await _dataSource.changePassword(request);

    return switch (response) {
      SuccessResponse<ChangePasswordResponse>() => SuccessResponse(
          data: response.data.toDomain(),
        ),
      ErrorResponse<ChangePasswordResponse>() => ErrorResponse(
          errorMessage: response.errorMessage,
        ),
    };
  }
}
