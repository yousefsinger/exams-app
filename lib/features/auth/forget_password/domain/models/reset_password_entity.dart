import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  final String token;
  final String message;

  const ResetPasswordEntity({required this.token, required this.message});

  @override
  List<Object?> get props => [token, message];
}
