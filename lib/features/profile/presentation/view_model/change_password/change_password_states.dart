import 'package:equatable/equatable.dart';
import '../../../../../config/api/base_states.dart';
import '../../../domain/model/change_password_entity.dart';

class ChangePasswordStates extends Equatable {
  final BaseState<ChangePasswordEntity>? changePassword;
  final String? currentPasswordError;

  const ChangePasswordStates({
    this.changePassword,
    this.currentPasswordError,
  });

  ChangePasswordStates copyWith({
    BaseState<ChangePasswordEntity>? changePassword,
    String? currentPasswordError,
  }) {
    return ChangePasswordStates(
      changePassword: changePassword ?? this.changePassword,
      currentPasswordError: currentPasswordError,
    );
  }

  @override
  List<Object?> get props => [
    changePassword,
    currentPasswordError,
  ];
}