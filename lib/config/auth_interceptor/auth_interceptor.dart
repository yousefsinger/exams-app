import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../config/cashe/user_session.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final UserSession userSession;

  AuthInterceptor(this.userSession);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = userSession.token?.trim();

    if (token != null && token.isNotEmpty) {
      options.headers['token'] = token;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
    }

    handler.next(err);
  }
}