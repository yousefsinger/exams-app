import 'package:equatable/equatable.dart';

class VerifiyResetCodeEntity extends Equatable {
  final String status;

  const VerifiyResetCodeEntity({required this.status});

  @override
  List<Object?> get props => [status];
}
