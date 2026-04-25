import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  String? message;
  User? user;

  UserResponse({this.message, this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}