import '../../domain/entities/signup_entity.dart';

class SignUpRequestModel extends SignUpEntity {
  const SignUpRequestModel({
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.password,
    required super.confirmPassword,
    required super.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
    'username': username,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'password': password,
    'rePassword': confirmPassword,
    'phone': phoneNumber,
  };

  factory SignUpRequestModel.fromEntity(SignUpEntity e) => SignUpRequestModel(
    username: e.username,
    firstName: e.firstName,
    lastName: e.lastName,
    email: e.email,
    password: e.password,
    confirmPassword: e.confirmPassword,
    phoneNumber: e.phoneNumber,
  );
}
