import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_strings.dart';
import '../../../../../core/values/validators.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custome_text_field.dart';
import '../view_model/bloc/forget_password_events.dart';
import '../view_model/bloc/forget_password_states.dart';
import '../view_model/bloc/forget_password_view_model.dart';
import '../widgets/custom_forget_password_text_widget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,
      listener: (context, state) {
        final resetState = state.resetPasswordState;

        if (resetState?.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(resetState!.data!.message),
              backgroundColor: Colors.green,
            ),
          );

          Navigator.popUntil(context, (route) => route.isFirst);
        }

        if (resetState?.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(resetState!.errorMessage!)));
        }
      },
      builder: (context, state) {
        final viewModel = context.read<ForgetPasswordViewModel>();

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            title: const Text(AppStrings.password),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Form(
                key: viewModel.resetPasswordFormKey,
                child: Column(
                  children: [
                    CustomForgetPasswordTextWidget(
                      text1: AppStrings.resetPassword,
                      text2: AppStrings.passwordValidationText,
                    ),
                    SizedBox(height: 24.h),
                    CustomTextField(
                      controller: viewModel.passwordController,
                      label: AppStrings.newPassword,
                      hint: AppStrings.enterYourPassword,
                      validator: AppValidators.validatePassword,
                      isObscureText: state.isNewPasswordObscure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.isNewPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          viewModel.doIntent(
                            ToggleNewPasswordVisibilityEvent(),
                          );
                        },
                      ),
                      onChanged: (Tab p1) {},
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      controller: viewModel.confirmPasswordController,
                      label: AppStrings.confirmPassword,
                      hint: AppStrings.confirmPassword,
                      validator: (value) {
                        return AppValidators.validateConfirmPassword(
                          value,
                          viewModel.passwordController.text,
                        );
                      },
                      isObscureText: state.isConfirmPasswordObscure,
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.isConfirmPasswordObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          viewModel.doIntent(
                            ToggleConfirmPasswordVisibilityEvent(),
                          );
                        },
                      ),
                      onChanged: (Tab p1) {},
                    ),
                    SizedBox(height: 30.h),
                    CustomElevatedButton(
                      text: AppStrings.continueText,
                      onPressed: () {
                        viewModel.doIntent(ValidateNewPasswordEvent());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
