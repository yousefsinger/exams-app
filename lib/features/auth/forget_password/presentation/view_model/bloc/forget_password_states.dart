import '../../../../../../config/api/base_states.dart';
import '../../../domain/models/forget_password_model.dart';
import '../../../domain/models/reset_password_model.dart';
import '../../../domain/models/verifiy_reset_code_model.dart';

class ForgetPasswordStates {
  BaseState<ForgetPasswordModel>? forgetPasswordState;
  BaseState<VerifyResetCodeModel>? verifyResetCodeState;
  BaseState<ResetPasswordModel>? resetPasswordState;

  final bool isNewPasswordObscure;
  final bool isConfirmPasswordObscure;
  final bool isButtonEnabled;

  final String? currentEmail;

  BaseState<ForgetPasswordModel>? resendCodeState;

  ForgetPasswordStates({
    this.forgetPasswordState,
    this.verifyResetCodeState,
    this.resetPasswordState,
    this.resendCodeState,
    this.isNewPasswordObscure = true,
    this.isConfirmPasswordObscure = true,
    this.isButtonEnabled = false,
    this.currentEmail,
  });
  ForgetPasswordStates copyWith({
    BaseState<ForgetPasswordModel>? forgetPasswordState,
    BaseState<VerifyResetCodeModel>? verifyResetCodeState,
    BaseState<ResetPasswordModel>? resetPasswordState,
    BaseState<ForgetPasswordModel>? resendCodeState,
    bool? isNewPasswordObscure,
    bool? isConfirmPasswordObscure,
    bool? isButtonEnabled,
    String? currentEmail,
  }) {
    return ForgetPasswordStates(
      forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
      verifyResetCodeState: verifyResetCodeState ?? this.verifyResetCodeState,
      resetPasswordState: resetPasswordState ?? this.resetPasswordState,
      resendCodeState: resendCodeState ?? this.resendCodeState,
      isNewPasswordObscure: isNewPasswordObscure ?? this.isNewPasswordObscure,
      isConfirmPasswordObscure:
      isConfirmPasswordObscure ?? this.isConfirmPasswordObscure,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      currentEmail: currentEmail ?? this.currentEmail,
    );
  }
}