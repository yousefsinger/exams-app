import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/values/api_constants.dart';

part "signup_api_client.g.dart";

@RestApi()
abstract class SignupApiClient {
  factory SignupApiClient(Dio dio, {String? baseUrl}) = _SignupApiClient;

  @POST(ApiConstants.signup)
  Future<Map<String, dynamic>> signup(@Body() Map<String, dynamic> body);
}
