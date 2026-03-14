sealed class ForgetPasswordEvent {}

class SubmitEmailEvent extends ForgetPasswordEvent {
  final String email;

  SubmitEmailEvent(this.email);
}

class VerifyCodeEvent extends ForgetPasswordEvent {
  final String email;
  final String code;

  VerifyCodeEvent(this.email, this.code);
}

class ResetPasswordEvent extends ForgetPasswordEvent {
  final String email;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordEvent(this.email, this.newPassword, this.confirmPassword);
}

class UpdateButtonState extends ForgetPasswordEvent {}

class ToggleNewPasswordVisibilityEvent extends ForgetPasswordEvent {}

class ToggleConfirmPasswordVisibilityEvent extends ForgetPasswordEvent {}

class ValidateEmailEvent extends ForgetPasswordEvent {}

class ValidateCodeEvent extends ForgetPasswordEvent {}

class ResendCodeEvent extends ForgetPasswordEvent {
  final String email;
  ResendCodeEvent(this.email);
}

class ResetResendCodeState extends ForgetPasswordEvent {}

class ValidateNewPasswordEvent extends ForgetPasswordEvent {}