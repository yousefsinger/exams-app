import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/login/api/login_api_client/login_api_client.dart';
import '../../features/auth/signup/api/signup_api_client/signup_api_client.dart';

@module
abstract class DioModule {
  @lazySingleton
  LoginApiClient loginApiClient(Dio dio) => LoginApiClient(dio);
  @lazySingleton
  SignupApiClient  signupApiClient(Dio dio) => SignupApiClient(dio);
}