import 'package:exam_app/config/api/base_response.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/api/base_states.dart';
import '../../../domain/model/user.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_events.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  final LoginUseCase _loginUseCase;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginViewModel(this._loginUseCase) : super(LoginStates());

  void doIntent(LoginEvent event) {
    switch (event) {
      case SubmitLoginEvent():
        _login(event);
      case ToggleRememberMeEvent():
        _toggleRememberMe();
      case ValidateLoginEvent():
        _validateLogin();
      case UpdateLoginButtonState():
        emit(state.copyWith(isButtonEnabled: event.isEnabled));
    }
  }

  Future<void> _login(SubmitLoginEvent event) async {
    emit(
      state.copyWith(
        loginState: BaseState<User>(isLoading: true),
      ),
    );

    final response = await _loginUseCase.call(
      event.email,
      event.password,
      state.isRememberMeChecked,
    );

    switch (response) {
      case SuccessResponse<User>():
        emit(
          state.copyWith(
            loginState: BaseState<User>(
              isLoading: false,
              data: response.data,
            ),
          ),
        );
      case ErrorResponse<User>():
        emit(
          state.copyWith(
            loginState: BaseState<User>(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }

  void _toggleRememberMe() {
    emit(state.copyWith(isRememberMeChecked: !state.isRememberMeChecked));
  }

  void _validateLogin() {
    if (loginFormKey.currentState?.validate() ?? false) {
      final event = SubmitLoginEvent(
        emailController.text.trim(),
        passwordController.text,
      );
      _login(event);
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}