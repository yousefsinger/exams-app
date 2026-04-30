import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../core/values/api_constants.dart';
import '../cashe/user_session.dart';

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

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final String? token = userSession.token?.trim();

          if (token != null && token.isNotEmpty) {
            options.headers['token'] = token;
          }



          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
            print("⚠️ Unauthorized: Server rejected the token.");
            print("Server Message: ${e.response?.data}");
          }
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}