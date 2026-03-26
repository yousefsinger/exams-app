abstract class BaseResponse {}

class SuccessBaseResponse extends BaseResponse {}

class ErrorBaseResponse extends BaseResponse {
  final String message;
  ErrorBaseResponse({required this.message});
}