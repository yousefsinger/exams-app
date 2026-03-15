import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../../../../core/handle_error/handle_error.dart';
import '../../data/data_sources/forget_password_data_source_contract.dart';
import '../../data/models/forget_password/forget_password_request.dart';
import '../../data/models/forget_password/forget_password_response.dart';
import '../../data/models/reset_password/reset_password_request.dart';
import '../../data/models/reset_password/reset_password_response.dart';
import '../../data/models/verify_password/verify_reset_code_request.dart';
import '../../data/models/verify_password/verify_reset_code_response.dart';
import '../api_client/api_client.dart';

@Injectable(as: ForgetPasswordRemoteDataSourceContract)
class ForgetPasswordRemoteDatasourceImple
    implements ForgetPasswordRemoteDataSourceContract {
  final ApiClient _apiClient;

  ForgetPasswordRemoteDatasourceImple(this._apiClient);

  @override
  Future<BaseResponse<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest request,
      ) async {
    try {
      final response = await _apiClient.forgetPassword(request);
      return SuccessResponse(data: response);
    } on DioException catch (e) {
      return ErrorResponse(errorMessage: ErrorHandler.handleError(e));
    } catch (e) {
      return ErrorResponse(errorMessage: "Unexpected error occurred");
    }
  }

  @override
  Future<BaseResponse<ResetPasswordResponse>> resetPassword(
      ResetPasswordRequest request,
      ) async {
    try {
      final response = await _apiClient.resetPassword(request);

      return SuccessResponse(data: response);
    } on DioException catch (e) {
      final errorMessage = ErrorHandler.handleError(e);
      return ErrorResponse(errorMessage: errorMessage);
    } catch (e, stackTrace) {
      log('[StackTrace] $stackTrace');
      return ErrorResponse(errorMessage: 'Unexpected error occurred');
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeResponse>> verifyResetCode(
      VerifyResetCodeRequest request,
      ) async {
    try {
      final response = await _apiClient.verifyResetCode(request);

      return SuccessResponse(data: response);
    } on DioException catch (e) {
      final errorMessage = ErrorHandler.handleError(e);
      return ErrorResponse(errorMessage: errorMessage);
    } catch (e, stackTrace) {
      log('[StackTrace] $stackTrace');
      return ErrorResponse(errorMessage: 'Unexpected error occurred');
    }
  }
}