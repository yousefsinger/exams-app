import 'package:dio/dio.dart';
import 'package:exam_app/config/di/di.dart';
import 'package:injectable/injectable.dart';

import '../../core/values/api_constants.dart';
import '../../features/auth/login/api/login_api_client/login_api_client.dart';
import '../../features/auth/signup/api/signup_api_client/signup_api_client.dart';
import '../cashe/secure_storage.dart';
import '../cashe/user_session.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dioInstance = Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl));

    dioInstance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = getIt<UserSession>().token;

          if (token == null) {
            token = await getIt<SecureStorage>().getToken();

            if (token != null) {
              getIt<UserSession>().token = token;
            }
          }

          if (token != null) {
            options.headers['token'] = token;
          }

          return handler.next(options);
        },
      ),
    );

    return dioInstance;
  }

  @lazySingleton
  LoginApiClient get loginApiClient => LoginApiClient(dio);

  @lazySingleton
  SignupApiClient get signupApiClient => SignupApiClient(dio);
}