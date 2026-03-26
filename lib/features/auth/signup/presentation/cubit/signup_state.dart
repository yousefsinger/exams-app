part of 'signup_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpError extends SignUpState {
  final String errorMsg;
  SignUpError({required this.errorMsg});
}

// Field-level validation state
final class SignUpValidation extends SignUpState {
  final String? usernameError;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final String? phoneError;
  final bool obscurePassword;
  final bool obscureConfirmPassword;

  SignUpValidation({
    this.usernameError,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.phoneError,
    this.obscurePassword = true,
    this.obscureConfirmPassword = true,
  });

  SignUpValidation copyWith({
    String? usernameError,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? phoneError,
    bool? obscurePassword,
    bool? obscureConfirmPassword,
    bool clearUsernameError = false,
    bool clearFirstNameError = false,
    bool clearLastNameError = false,
    bool clearEmailError = false,
    bool clearPasswordError = false,
    bool clearConfirmPasswordError = false,
    bool clearPhoneError = false,
  }) {
    return SignUpValidation(
      usernameError: clearUsernameError ? null : (usernameError ?? this.usernameError),
      firstNameError: clearFirstNameError ? null : (firstNameError ?? this.firstNameError),
      lastNameError: clearLastNameError ? null : (lastNameError ?? this.lastNameError),
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      passwordError: clearPasswordError ? null : (passwordError ?? this.passwordError),
      confirmPasswordError: clearConfirmPasswordError ? null : (confirmPasswordError ?? this.confirmPasswordError),
      phoneError: clearPhoneError ? null : (phoneError ?? this.phoneError),
      obscurePassword: obscurePassword ?? this.obscurePassword,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
    );
  }
}
