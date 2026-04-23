class SignupResponseModel {
  final String? message;
  final String? token;

  SignupResponseModel({this.message, this.token});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
      message: json['message'],
      token: json['token'],
    );
  }
}