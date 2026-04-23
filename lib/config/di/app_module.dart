import 'package:dio/dio.dart';
import 'package:exam_app/config/auth_interceptor/auth_interceptor.dart';
import 'package:exam_app/config/cashe/user_session.dart';
import 'package:exam_app/core/values/api_constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  @lazySingleton
  Dio provideDio(UserSession userSession) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(AuthInterceptor(userSession));

    return dio;
  }
}
