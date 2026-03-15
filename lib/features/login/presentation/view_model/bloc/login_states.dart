import '../../../../../config/api/base_states.dart';
import '../../../domain/model/user.dart';

class LoginStates {
  BaseState<User>? loginState;

  final bool isRememberMeChecked;
  final bool isButtonEnabled;

  LoginStates({
    this.loginState,
    this.isRememberMeChecked = false,
    this.isButtonEnabled = false,
  });

  LoginStates copyWith({
    BaseState<User>? loginState,
    bool? isRememberMeChecked,
    bool? isButtonEnabled,
  }) {
    return LoginStates(
      loginState: loginState ?? this.loginState,
      isRememberMeChecked: isRememberMeChecked ?? this.isRememberMeChecked,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}
