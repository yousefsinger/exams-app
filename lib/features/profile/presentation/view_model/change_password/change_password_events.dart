sealed class ChangePasswordEvents {}

class SubmitChangePassword extends ChangePasswordEvents {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  SubmitChangePassword({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}

class ClearCurrentPasswordError extends ChangePasswordEvents {}