import 'package:exam_app/core/values/app_strings.dart';

abstract class AppValidators {

  static String? validateEmail(String? value) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value == null || value.trim().isEmpty) {
      return AppStrings.thisFieldRequired;
    } else if (emailRegex.hasMatch(value) == false) {
      return AppStrings.enterValidEmail;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (value == null || value.trim().isEmpty) {
      return AppStrings.thisFieldRequired;
    } else if (value.length < 8 || !passwordRegex.hasMatch(value)) {
      return AppStrings.enterStrongPassword;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.thisFieldRequired;
    } else if (value != password) {
      return AppStrings.enterSamePassword;
    } else {
      return null;
    }
  }

  static String? validateUsername(String? value) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (value == null || value.trim().isEmpty) {
      return AppStrings.thisFieldRequired;
    } else if (!usernameRegex.hasMatch(value)) {
      return AppStrings.enterValidUsername;
    } else {
      return null;
    }
  }

  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.thisFieldRequired;
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null) {
      return AppStrings.thisFieldRequired;
    } else if (int.tryParse(value.trim()) == null) {
      return AppStrings.enterNumbersOnly;
    } else if (value.trim().length != 11) {
      return AppStrings.valueMustEqual11Digit;
    } else {
      return null;
    }
  }
}
