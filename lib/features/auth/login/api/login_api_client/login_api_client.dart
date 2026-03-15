import 'package:dio/dio.dart';
import 'package:exam_app/core/values/strings.dart';
import 'package:retrofit/retrofit.dart';

import '../responses/login_response.dart';

part 'login_api_client.g.dart';

@RestApi(baseUrl: baseurl)
abstract class LoginApiClient {
  factory LoginApiClient(Dio dio, {String baseUrl}) = _LoginApiClient;

  @POST(loginEndpoint)
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);
}
