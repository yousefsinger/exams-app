import 'package:dio/dio.dart';
import 'package:exam_app/core/values/api_constants.dart';
import 'package:retrofit/retrofit.dart';

import '../responses/login_response.dart';

part 'login_api_client.g.dart';

@RestApi()
abstract class LoginApiClient {
  factory LoginApiClient(Dio dio, {String baseUrl}) = _LoginApiClient;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);
}
