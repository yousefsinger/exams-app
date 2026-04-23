import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../../../../config/api/base_states.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../data/model/change_password_request/change_password_request.dart';
import '../../../domain/model/change_password_entity.dart';
import '../../../domain/use_cases/change_password_use_case.dart';
import 'change_password_events.dart';
import 'change_password_states.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordStates> {
  final ChangePasswordUseCase _useCase;

  ChangePasswordViewModel(this._useCase)
      : super(const ChangePasswordStates());

  void doIntent(ChangePasswordEvents event) {
    switch (event) {
      case SubmitChangePassword():
        _changePassword(event);
      case ClearCurrentPasswordError():
        emit(state.copyWith(currentPasswordError: null));
    }
  }

  Future<void> _changePassword(SubmitChangePassword event) async {
    emit(
      state.copyWith(
        changePassword: const BaseState(isLoading: true),
        currentPasswordError: null,
      ),
    );

    final response = await _useCase.call(
      ChangePasswordRequest(
        oldPassword: event.oldPassword,
        password: event.newPassword,
        rePassword: event.confirmPassword,
      ),
    );

    switch (response) {
      case SuccessResponse<ChangePasswordEntity>():
        emit(
          state.copyWith(
            changePassword: BaseState(data: response.data),
          ),
        );
      case ErrorResponse<ChangePasswordEntity>():
        emit(
          state.copyWith(
            changePassword: const BaseState(),
            currentPasswordError: AppStrings.invalidPassword,
          ),
        );
    }
  }
}