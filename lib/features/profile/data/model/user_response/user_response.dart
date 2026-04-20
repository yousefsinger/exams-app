import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/user_entity.dart';

part 'user_response.g.dart';
@JsonSerializable()
class UserModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "password")
  String? password;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "createdAt")
  DateTime? createdAt;
  @JsonKey(name: "passwordResetCode")
  String? passwordResetCode;
  @JsonKey(name: "passwordResetExpires")
  DateTime? passwordResetExpires;
  @JsonKey(name: "resetCodeVerified")
  bool? resetCodeVerified;
  @JsonKey(name: "passwordChangedAt")
  DateTime? passwordChangedAt;

  UserModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.password,
    this.isVerified,
    this.createdAt,
    this.passwordResetCode,
    this.passwordResetExpires,
    this.resetCodeVerified,
    this.passwordChangedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  UserEntity toDomain() => UserEntity(   id: id ?? "",
  userName: username ?? "",
  firstName: firstName ?? "",
  lastName: lastName ?? "",
  email: email ?? "",
  phone: phone ?? "",);
}