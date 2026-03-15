import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/values/api_constants.dart';
import '../../features/auth/login/api/login_api_client/login_api_client.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl,));

  @lazySingleton
  LoginApiClient get loginApiClient => LoginApiClient(dio);
}