import 'package:exam_app/core/values/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/validators.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custome_text_field.dart';
import '../screens/otp_screen.dart';
import '../view_model/bloc/forget_password_events.dart';
import '../view_model/bloc/forget_password_states.dart';
import '../view_model/bloc/forget_password_view_model.dart';
import '../widgets/custom_forget_password_text_widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.forgetPasswordState != current.forgetPasswordState,
      listener: (context, state) {
        final forgetState = state.forgetPasswordState;

        if (forgetState?.data != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ForgetPasswordViewModel>(),
                child: const OtpScreen(),
              ),
            ),
          );
        }

        if (forgetState?.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(forgetState!.errorMessage!)));
        }
      },
      builder: (context, state) {
        final viewModel = context.read<ForgetPasswordViewModel>();

        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            title: const Text(AppStrings.forgetPassword),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: viewModel.emailFormKey,
              child: Column(
                children: [
                  CustomForgetPasswordTextWidget(
                    text1: AppStrings.forgetPassword,
                    text2: AppStrings.enterEmailText,
                  ),
                  CustomTextField(
                    controller: viewModel.emailController,
                    label: AppStrings.email,
                    hint: AppStrings.enterEmail,
                    validator: AppValidators.validateEmail,
                  ),
                  CustomElevatedButton(
                    text: AppStrings.continueText,
                    onPressed: () {
                      viewModel.doIntent(ValidateEmailEvent());
                    },
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
