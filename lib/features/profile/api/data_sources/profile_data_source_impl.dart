import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/api/base_response.dart';
import '../../../../core/handle_error/handle_error.dart';
import '../../../../core/values/api_errors_constants.dart';
import '../../data/data_sources/profile_remote_data_source_contract.dart';
import '../../data/model/change_password_request/change_password_request.dart';
import '../../data/model/change_password_response/change_password_response.dart';
import '../../data/model/update_profile_request/update_profile_request.dart';
import '../../data/model/update_profile_response/update_profile_response.dart';
import '../../data/model/user_response/user.dart';
import '../api_client/profile_api_client.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiClient _apiClient;

  ProfileRemoteDataSourceImpl(this._apiClient);

  @override
  Future<BaseResponse<User>> getUser() async {
    try {
      final response = await _apiClient.getUserData();

      if (response.user == null) {
        return ErrorResponse(errorMessage: ApiErrorsConstants.userNotFound);
      }

      return SuccessResponse(data: response.user!);

    } on DioException catch (e) {
      return ErrorResponse(errorMessage: ErrorHandler.handleError(e));
    } catch (e) {
      return ErrorResponse(errorMessage: ApiErrorsConstants.unknownError);
    }
  }
  @override
  Future<BaseResponse<UpdateProfileResponse>> updateProfile(
      UpdateProfileRequest request,
      ) async {
    try {
      final response = await _apiClient.updateProfile(request);
      return SuccessResponse(data: response);

    } on DioException catch (e) {
      return ErrorResponse(errorMessage: ErrorHandler.handleError(e));
    } catch (e) {
      return ErrorResponse(errorMessage: ApiErrorsConstants.unknownError);
    }
  }
  @override
  Future<BaseResponse<ChangePasswordResponse>> changePassword(
      ChangePasswordRequest request,
      ) async {
    try {
      final response = await _apiClient.changePassword(request);
      return SuccessResponse(data: response);

    } on DioException catch (e) {
      return ErrorResponse(errorMessage: ErrorHandler.handleError(e));
    } catch (e) {
      return ErrorResponse(errorMessage: ApiErrorsConstants.unknownError);
    }
  }
}