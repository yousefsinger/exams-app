import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/api/base_response.dart';
import '../../../../../../config/api/base_states.dart';
import '../../../domain/models/forget_password_entity.dart';
import '../../../domain/models/reset_password_entity.dart';
import '../../../domain/models/verifiy_reset_code_entity.dart';
import '../../../domain/use_cases/forget_password_use_case.dart';
import '../../../domain/use_cases/reset_password_use_case.dart';
import '../../../domain/use_cases/verify_reset_password_use_case.dart';
import 'forget_password_events.dart';
import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordUseCase _forgetPasswordUseCase;
  final VerifyResetPasswordUseCase _verifyResetPasswordUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;

  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController verifyCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String? userEmail;

  ForgetPasswordViewModel(this._forgetPasswordUseCase,
      this._verifyResetPasswordUseCase, this._resetPasswordUseCase)
      : super(ForgetPasswordStates());

  void doIntent(ForgetPasswordEvent event) {
    switch (event) {
      case SubmitEmailEvent():
        _forgetPassword(event);

      case VerifyCodeEvent():
        _verifyResetCode(event);

      case ResetPasswordEvent():
        _resetPassword(event);

      case ToggleNewPasswordVisibilityEvent():
        _toggleNewPasswordVisibility();

      case ToggleConfirmPasswordVisibilityEvent():
        _toggleConfirmPasswordVisibility();

      case UpdateButtonState():
        emit(state.copyWith());

      case ValidateEmailEvent():
        userEmail = emailController.text.trim();
        _validateEmail();

      case ValidateCodeEvent():
        _validateCode();

      case ValidateNewPasswordEvent():
        _validateNewPassword();

      case ResendCodeEvent():
        _resendCode(event);

      case ResetResendCodeState():
        return emit(
            state.copyWith(resendCodeState: BaseState<ForgetPasswordEntity>()));

    }
  }

  Future<void> _forgetPassword(SubmitEmailEvent event) async {
    emit(
      state.copyWith(
        forgetPasswordState: BaseState<ForgetPasswordEntity>(isLoading: true),
      ),
    );

    final response = await _forgetPasswordUseCase.callForgetPassword(
      event.email,
    );

    switch (response) {
      case SuccessResponse<ForgetPasswordEntity>():
        return emit(
          state.copyWith(
            forgetPasswordState: BaseState<ForgetPasswordEntity>(
              isLoading: false,
              data: response.data,
            ),
            currentEmail: event.email,
          ),
        );

      case ErrorResponse<ForgetPasswordEntity>():
        return emit(
          state.copyWith(
            forgetPasswordState: BaseState(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _verifyResetCode(VerifyCodeEvent event) async {
    emit(
      state.copyWith(
        verifyResetCodeState:
            BaseState<VerifiyResetCodeEntity>(isLoading: true),
      ),
    );

    final response = await _verifyResetPasswordUseCase.callVerifyResetCode(
      event.code,
    );

    switch (response) {
      case SuccessResponse<VerifiyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetCodeState: BaseState<VerifiyResetCodeEntity>(
              isLoading: false,
              data: response.data,
            ),
          ),
        );

      case ErrorResponse<VerifiyResetCodeEntity>():
        emit(
          state.copyWith(
            verifyResetCodeState: BaseState<VerifiyResetCodeEntity>(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  Future<void> _resetPassword(ResetPasswordEvent event) async {
    emit(
      state.copyWith(
        resetPasswordState: BaseState<ResetPasswordEntity>(isLoading: true),
      ),
    );

    final response = await _resetPasswordUseCase.callResetPassword(
      event.email,
      event.newPassword,
    );

    switch (response) {
      case SuccessResponse<ResetPasswordEntity>():
        emit(
          state.copyWith(
            resetPasswordState: BaseState<ResetPasswordEntity>(
              isLoading: false,
              data: response.data,
            ),
          ),
        );

      case ErrorResponse<ResetPasswordEntity>():
        emit(
          state.copyWith(
            resetPasswordState: BaseState<ResetPasswordEntity>(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  void _toggleNewPasswordVisibility() {
    emit(state.copyWith(isNewPasswordObscure: !state.isNewPasswordObscure));
  }

  void _toggleConfirmPasswordVisibility() {
    emit(
      state.copyWith(isConfirmPasswordObscure: !state.isConfirmPasswordObscure),
    );
  }

  void _validateEmail() {
    if (emailFormKey.currentState?.validate() ?? false) {
      final event = SubmitEmailEvent(emailController.text.trim());
      _forgetPassword(event);
    }
  }

  void _validateCode() {
    final event = VerifyCodeEvent(
      state.currentEmail ?? '',
      verifyCodeController.text.trim(),
    );
    _verifyResetCode(event);
  }

  void _validateNewPassword() {
    if (resetPasswordFormKey.currentState?.validate() ?? false) {
      final event = ResetPasswordEvent(
        state.currentEmail ?? '',
        passwordController.text,
        confirmPasswordController.text,
      );
      _resetPassword(event);
    }
  }

  Future<void> _resendCode(ResendCodeEvent event) async {
    verifyCodeController.clear();

    emit(
      state.copyWith(
        resendCodeState: BaseState<ForgetPasswordEntity>(isLoading: true),
      ),
    );

    final response = await _forgetPasswordUseCase.callForgetPassword(
      event.email,
    );

    switch (response) {
      case SuccessResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendCodeState: BaseState<ForgetPasswordEntity>(
              isLoading: false,
              data: response.data,
            ),
          ),
        );

      case ErrorResponse<ForgetPasswordEntity>():
        emit(
          state.copyWith(
            resendCodeState: BaseState(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    verifyCodeController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
