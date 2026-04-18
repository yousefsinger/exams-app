import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../core/values/validators.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custome_text_field.dart';
import '../view_model/bloc/forget_password_events.dart';
import '../view_model/bloc/forget_password_states.dart';
import '../view_model/bloc/forget_password_view_model.dart';
import '../widgets/custom_forget_password_text_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isNewPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    return BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.resetPasswordState != current.resetPasswordState,

      listener: (context, state) {
        final resetState = state.resetPasswordState;
        if (resetState?.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(resetState!.data!.message),
              backgroundColor: AppColors.primaryColor,
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

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          leading: IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: const Text(AppStrings.password),
        ),

        body: BlocBuilder<ForgetPasswordViewModel, ForgetPasswordStates>(
          buildWhen: (prev, curr) =>
              prev.resetPasswordState != curr.resetPasswordState,

          builder: (context, state) {
            final isLoading = state.resetPasswordState?.isLoading == true;

            return Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),

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
                            isObscureText: isNewPasswordObscure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isNewPasswordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  isNewPasswordObscure = !isNewPasswordObscure;
                                });
                              },
                            ),
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
                            isObscureText: isConfirmPasswordObscure,
                            suffixIcon: IconButton(
                              icon: Icon(
                                isConfirmPasswordObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  isConfirmPasswordObscure =
                                      !isConfirmPasswordObscure;
                                });
                              },
                            ),
                          ),

                          SizedBox(height: 30.h),
                          SizedBox(
                            width: double.infinity,
                            child: CustomElevatedButton(
                              text: AppStrings.continueText,
                              onPressed: () {
                                viewModel.doIntent(ValidateNewPasswordEvent());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
