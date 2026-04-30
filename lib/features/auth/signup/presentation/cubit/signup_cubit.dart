import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/core/values/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/signup_entity.dart';
import '../../domain/use_cases/signup_use_case.dart';

part 'signup_state.dart';
@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitial());

  SignUpValidation get _validation =>
      state is SignUpValidation ? state as SignUpValidation : SignUpValidation();

  // ── Visibility toggles ────────────────────────────────────────────────────

  void togglePasswordVisibility() {
    emit(_validation.copyWith(
      obscurePassword: !_validation.obscurePassword,
    ));
  }

  void toggleConfirmPasswordVisibility() {
    emit(_validation.copyWith(
      obscureConfirmPassword: !_validation.obscureConfirmPassword,
    ));
  }

  // ── Live field validation ─────────────────────────────────────────────────

  void onUsernameChanged(String value) {
    emit(_validation.copyWith(
      usernameError: AppValidators.validateUsername(value),
    ));
  }

  void onFirstNameChanged(String value) {
    emit(_validation.copyWith(
      firstNameError: AppValidators.validateFullName(value),
    ));
  }

  void onLastNameChanged(String value) {
    emit(_validation.copyWith(
      lastNameError: AppValidators.validateFullName(value),
    ));
  }

  void onEmailChanged(String value) {
    emit(_validation.copyWith(
      emailError: AppValidators.validateEmail(value),
    ));
  }

  void onPasswordChanged(String password, String confirmPassword) {
    final passwordError = AppValidators.validatePassword(password);

    // Only show confirm password mismatch if user already entered something
    String? confirmPasswordError;
    if (confirmPassword.trim().isNotEmpty) {
      confirmPasswordError = AppValidators.validateConfirmPassword(
        confirmPassword,
        password,
      );
    }

    emit(_validation.copyWith(
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    ));
  }

  void onConfirmPasswordChanged(String confirmPassword, String password) {
    emit(_validation.copyWith(
      confirmPasswordError: AppValidators.validateConfirmPassword(
        confirmPassword,
        password,
      ),
    ));
  }

  void onPhoneChanged(String value) {
    emit(_validation.copyWith(
      phoneError: AppValidators.validatePhoneNumber(value),
    ));
  }

  // ── Submit ────────────────────────────────────────────────────────────────

  Future<void> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
  }) async {
    final usernameError = AppValidators.validateUsername(username);
    final firstNameError = AppValidators.validateFullName(firstName);
    final lastNameError = AppValidators.validateFullName(lastName);
    final emailError = AppValidators.validateEmail(email);
    final passwordError = AppValidators.validatePassword(password);
    final confirmPasswordError = AppValidators.validateConfirmPassword(
      confirmPassword,
      password,
    );
    final phoneError = AppValidators.validatePhoneNumber(phone);

    final hasErrors = usernameError != null ||
        firstNameError != null ||
        lastNameError != null ||
        emailError != null ||
        passwordError != null ||
        confirmPasswordError != null ||
        phoneError != null;

    if (hasErrors) {
      emit(SignUpValidation(
        usernameError: usernameError,
        firstNameError: firstNameError,
        lastNameError: lastNameError,
        emailError: emailError,
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
        phoneError: phoneError,
      ));
      return;
    }

    emit(SignUpLoading());

    final result = await _signUpUseCase(
      SignUpEntity(
        username: username,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phone,
      ),
    );

    if (result is SuccessResponse) {
      emit(SignUpSuccess());
    } else if (result is ErrorResponse) {
      emit(
          SignUpError(errorMsg: result.errorMessage ?? 'Something went wrong'));
    }
  }
}