import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_strings.dart';
import '../../../../core/values/validators.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custome_text_field.dart';
import '../view_model/change_password/change_password_events.dart';
import '../view_model/change_password/change_password_states.dart';
import '../view_model/change_password/change_password_view_model.dart';

class ChangePasswordScreenBody extends StatefulWidget {
  const ChangePasswordScreenBody({super.key});

  @override
  State<ChangePasswordScreenBody> createState() =>
      _ChangePasswordScreenBodyState();
}

class _ChangePasswordScreenBodyState extends State<ChangePasswordScreenBody> {
  final _formKey = GlobalKey<FormState>();

  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isCurrentVisible = false;
  bool isNewVisible = false;
  bool isConfirmVisible = false;

  @override
  void initState() {
    super.initState();

    currentPasswordController.addListener(() {
      context.read<ChangePasswordViewModel>().doIntent(
            ClearCurrentPasswordError(),
          );
    });
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ChangePasswordViewModel>().doIntent(
            SubmitChangePassword(
              oldPassword: currentPasswordController.text,
              newPassword: newPasswordController.text,
              confirmPassword: confirmPasswordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordViewModel, ChangePasswordStates>(
      listener: (context, state) {
        final result = state.changePassword;

        if (result?.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(AppStrings.passwordChangedSuccessfully),
              backgroundColor: AppColors.primaryColor,
            ),
          );

          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final isLoading = state.changePassword?.isLoading ?? false;

        return SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppBar(
                    title: const Text(AppStrings.resetPassword),
                    leading: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextField(
                    controller: currentPasswordController,
                    label: AppStrings.currentPassword,
                    isObscureText: !isCurrentVisible,
                    validator: AppValidators.validatePassword,
                    errorText: state.currentPasswordError,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isCurrentVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isCurrentVisible = !isCurrentVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: newPasswordController,
                    label: AppStrings.newPassword,
                    isObscureText: !isNewVisible,
                    validator: AppValidators.validatePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isNewVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isNewVisible = !isNewVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: confirmPasswordController,
                    label: AppStrings.confirmPassword,
                    isObscureText: !isConfirmVisible,
                    validator: (value) => AppValidators.validateConfirmPassword(
                      value,
                      newPasswordController.text,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isConfirmVisible = !isConfirmVisible;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 40.h),
                  isLoading
                      ? const CircularProgressIndicator()
                      : CustomElevatedButton(
                          text: AppStrings.update,
                          isValid: true,
                          onPressed: onSubmit,
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
