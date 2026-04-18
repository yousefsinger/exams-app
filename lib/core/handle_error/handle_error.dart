import 'package:dio/dio.dart';
import '../values/api_errors_constants.dart';

class ErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    }
    return ApiErrorsConstants.unknownError;
  }

  static String _handleDioError(DioException error) {
    return switch (error.type) {
      DioExceptionType.connectionTimeout => ApiErrorsConstants.connectionTimeoutError,
      DioExceptionType.sendTimeout => ApiErrorsConstants.sendTimeoutError,
      DioExceptionType.receiveTimeout => ApiErrorsConstants.receiveTimeoutError,
      DioExceptionType.badResponse => _handleBadResponse(error),
      DioExceptionType.cancel => ApiErrorsConstants.requestCancelledError,
      DioExceptionType.connectionError => ApiErrorsConstants.connectionError,
      DioExceptionType.badCertificate => ApiErrorsConstants.badCertificateError,
      DioExceptionType.unknown => _handleUnknownError(error),
    };
  }

  static String _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;

    return switch (statusCode) {
      400 => _extractErrorMessage(error, ApiErrorsConstants.badRequestError),
      401 => ApiErrorsConstants.unauthorizedError,
      403 => ApiErrorsConstants.forbiddenError,
      404 => ApiErrorsConstants.notFoundError,
      500 => ApiErrorsConstants.internalServerError,
      503 => ApiErrorsConstants.serviceUnavailableError,
      _ => _extractErrorMessage(error, ApiErrorsConstants.defaultError),
    };
  }

  static String _extractErrorMessage(DioException error, String defaultMessage) {
    try {
      final data = error.response?.data;
      if (data is Map<String, dynamic>) {
        return data['message']?.toString() ??
            data['error']?.toString() ??
            defaultMessage;
      }
      return defaultMessage;
    } catch (e) {
      return defaultMessage;
    }
  }

  static String _handleUnknownError(DioException error) {
    final message = error.message ?? '';
    if (message.contains('SocketException')) {
      return ApiErrorsConstants.noInternetError;
    }
    return ApiErrorsConstants.networkError;
  }
}