import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/validators.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custome_text_field.dart';
import '../../../../config/di/di.dart';
import '../../../../core/widgets/custom_text_link.dart';
import '../view_model/bloc/login_events.dart';
import '../view_model/bloc/login_states.dart';
import '../view_model/bloc/login_view_model.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<LoginViewModel>(),
        child: BlocConsumer<LoginViewModel, LoginStates>(
          listenWhen: (previous, current) =>
          previous.loginState != current.loginState,
          listener: (context, state) {
            final loginState = state.loginState;

            if (loginState?.data != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('logged in successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            }

            if (loginState?.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(loginState!.errorMessage!),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final viewModel = context.read<LoginViewModel>();

            return Scaffold(
              backgroundColor: AppColors.whiteColor,
              appBar: AppBar(
                backgroundColor: AppColors.whiteColor,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                      Icons.arrow_back_ios_new_outlined, color: Colors.black),
                ),
                title: const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Form(
                  key: viewModel.loginFormKey,
                  onChanged: () {
                    final isValid = viewModel.loginFormKey.currentState
                        ?.validate() ?? false;
                    viewModel.doIntent(UpdateLoginButtonState(isValid));
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: viewModel.emailController,
                          label: 'Email',
                          hint: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          validator: AppValidators.validateEmail,
                          errorText: '',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: viewModel.passwordController,
                          label: 'Password',
                          hint: 'Enter your password',
                          keyboardType: TextInputType.visiblePassword,
                          isObscureText: true,
                          validator: AppValidators.validatePassword,
                          errorText: '',
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 18.w,
                                  height: 18.h,
                                  child: Checkbox(
                                    value: state.isRememberMeChecked,
                                    onChanged: (value) {
                                      viewModel.doIntent(
                                          ToggleRememberMeEvent());
                                    },
                                    activeColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.r),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Text(
                                  'Remember me',
                                  style: TextStyle(fontSize: 13.sp,
                                      color: AppColors.blackColor),
                                ),
                              ],
                            ),
                            CustomTextLink(
                              text: 'forgot password?',
                              onTap: () {
                                //nav to forgot password
                              },
                              color: AppColors.blackColor,
                            )
                          ],
                        ),
                        SizedBox(height: 64.h),
                        state.loginState?.isLoading == true
                            ? const Center(child: CircularProgressIndicator(
                          color: AppColors.primaryColor,))
                            : CustomElevatedButton(
                          text: 'Login',
                          onPressed: state.isButtonEnabled
                              ? () {
                            viewModel.doIntent(ValidateLoginEvent());
                          }
                              : null,
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                  fontSize: 14.sp, color: AppColors.blackColor),
                            ),
                            CustomTextLink(
                                text: 'Sign up',
                                onTap: () {
                                  //nav to sign up
                                }
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}