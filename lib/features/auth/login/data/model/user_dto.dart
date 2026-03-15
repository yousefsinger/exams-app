import '../../domain/model/user.dart';

class UserDto {
  final String? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;

  UserDto({this.id, this.username, this.email, this.firstName, this.lastName});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );
  }
}

extension UserMapper on UserDto {
  User toDomain() {
    return User(
      id: id ?? '',
      username: username ?? '',
      email: email ?? '',
      firstName: firstName ?? '',
      lastName: lastName ?? '',
    );
  }
}
