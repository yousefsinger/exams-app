class BaseResponse<T> {
  final String? message;
  final int? code;
  final T? data;

  BaseResponse({this.message, this.code, this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJsonT,
  ) {
    return BaseResponse<T>(
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: fromJsonT != null
          ? (json.containsKey('data') && json['data'] != null
                ? fromJsonT(json['data'])
                : fromJsonT(json))
          : null,
    );
  }
}
