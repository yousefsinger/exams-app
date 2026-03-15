sealed class LoginEvent {}

class SubmitLoginEvent extends LoginEvent {
  final String email;
  final String password;

  SubmitLoginEvent(this.email, this.password);
}

class ToggleRememberMeEvent extends LoginEvent {}

class UpdateLoginButtonState extends LoginEvent {
  final bool isEnabled;

  UpdateLoginButtonState(this.isEnabled);
}

class ValidateLoginEvent extends LoginEvent {}
