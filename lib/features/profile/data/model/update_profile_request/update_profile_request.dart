import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
class UpdateProfileRequest {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  UpdateProfileRequest({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    return _$UpdateProfileRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}