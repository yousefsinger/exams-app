class ApiErrorsConstants {
  // Network Errors
  static const String connectionTimeoutError = 'Connection timeout. Please try again.';
  static const String sendTimeoutError = 'Request timeout. Please try again.';
  static const String receiveTimeoutError = 'Server response timeout. Please try again.';
  static const String connectionError = 'Connection failed. Please check your internet.';
  static const String noInternetError = 'No internet connection. Please check your network.';
  static const String networkError = 'Network error occurred. Please try again.';

  // HTTP Status Errors
  static const String badRequestError = 'Invalid request. Please check your input.';
  static const String unauthorizedError = 'Session expired. Please login again.';
  static const String forbiddenError = 'Access denied.';
  static const String notFoundError = 'Resource not found.';
  static const String internalServerError = 'Server error. Please try again later.';
  static const String serviceUnavailableError = 'Service temporarily unavailable.';

  // Other Errors
  static const String requestCancelledError = 'Request cancelled.';
  static const String badCertificateError = 'Security certificate error.';
  static const String unknownError = 'An unexpected error occurred.';
  static const String defaultError = 'Something went wrong. Please try again.';
  // New errors for ErrorHandle
  static const String userError = "User data or token is missing.";
  static const String userSessionError = "Failed to save user session:";
}