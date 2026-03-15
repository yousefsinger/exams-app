import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/values/api_constants.dart';
import '../../data/models/forget_password/forget_password_request.dart';
import '../../data/models/forget_password/forget_password_response.dart';
import '../../data/models/reset_password/reset_password_request.dart';
import '../../data/models/reset_password/reset_password_response.dart';
import '../../data/models/verify_password/verify_reset_code_request.dart';
import '../../data/models/verify_password/verify_reset_code_response.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest request,
  );

  @POST(ApiConstants.verifyResetCode)
  Future<VerifyResetCodeResponse> verifyResetCode(
    @Body() VerifyResetCodeRequest request,
  );

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest request,
  );
}
