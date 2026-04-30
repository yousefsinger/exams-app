import '../../domain/model/user.dart';

class UserDto {
  final String? id;
  final String? username;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? token;

  UserDto({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.token,
  });

  factory UserDto.fromJson(Map<String, dynamic> json, {String? tokenFromServer}) {
    return UserDto(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      token: (json['token'] as String?) ?? tokenFromServer,
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
      token: token ?? '',
    );
  }
}