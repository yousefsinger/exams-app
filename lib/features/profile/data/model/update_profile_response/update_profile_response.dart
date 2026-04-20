import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import '../../../domain/model/update_profile_entity.dart';
import '../user_response/user_response.dart';


part 'update_profile_response.g.dart';

UpdateProfileResponse updateProfileResponseFromJson(String str) => UpdateProfileResponse.fromJson(json.decode(str));

String updateProfileResponseToJson(UpdateProfileResponse data) => json.encode(data.toJson());

@JsonSerializable()
class UpdateProfileResponse {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "user")
  UserModel? user;

  UpdateProfileResponse({
    this.message,
    this.user,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) => _$UpdateProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileResponseToJson(this);
  UpdateProfileEntity toDomain() => UpdateProfileEntity(message: message ?? "", user: user?.toDomain());
}

