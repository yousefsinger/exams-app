import 'package:exam_app/core/values/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../../core/values/app_styles.dart';
import '../view_model/bloc/forget_password_events.dart';
import '../view_model/bloc/forget_password_states.dart';
import '../view_model/bloc/forget_password_view_model.dart';
import '../widgets/custom_forget_password_text_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ForgetPasswordViewModel>().verifyCodeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      textStyle: AppStyles.medium20Black,
      decoration: BoxDecoration(
        color: AppColors.icyBlueColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.errorColor),
    );

    return BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          previous.verifyResetCodeState != current.verifyResetCodeState ||
          previous.resendCodeState != current.resendCodeState,
      listener: (context, state) async {
        final verifyState = state.verifyResetCodeState;
        if (verifyState?.data != null) {
          final result = await Navigator.pushNamed(
            context,
            AppRoutes.resetPassword,
          );

          if (result == true) {
            viewModel.verifyCodeController.clear();
          }
        }
        if (verifyState?.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(verifyState!.errorMessage!)));
        }

        final resendState = state.resendCodeState;
        if (resendState?.data != null) {
          viewModel.verifyCodeController.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(AppStrings.codeSentAgain)),
          );
        }

        if (resendState?.errorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(resendState!.errorMessage!)));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              viewModel.verifyCodeController.clear();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: const Text(AppStrings.password),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
          child: Column(
            children: [
              CustomForgetPasswordTextWidget(
                text1: AppStrings.emailVerification,
                text2: AppStrings.enterYourCodeText,
              ),
              BlocBuilder<ForgetPasswordViewModel, ForgetPasswordStates>(
                buildWhen: (prev, curr) =>
                    prev.verifyResetCodeState != curr.verifyResetCodeState,
                builder: (context, state) {
                  final isLoading =
                      state.verifyResetCodeState?.isLoading == true;

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Column(
                      children: [
                        Pinput(
                          controller: viewModel.verifyCodeController,
                          length: 6,
                          enabled: !isLoading,
                          defaultPinTheme: defaultPinTheme,
                          errorPinTheme: errorPinTheme,
                          onCompleted: (code) {
                            viewModel.doIntent(
                              VerifyCodeEvent(viewModel.userEmail ?? '', code),
                            );
                          },
                        ),

                        if (isLoading)
                          const Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: CircularProgressIndicator(),
                          ),
                      ],
                    ),
                  );
                },
              ),
              BlocBuilder<ForgetPasswordViewModel, ForgetPasswordStates>(
                buildWhen: (prev, curr) =>
                    prev.resendCodeState != curr.resendCodeState,
                builder: (context, state) {
                  final isLoading = state.resendCodeState?.isLoading == true;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.didNotReceiveCode),

                      isLoading
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ),
                            )
                          : TextButton(
                              onPressed: () {
                                viewModel.verifyCodeController.clear();
                                viewModel.doIntent(
                                  ResendCodeEvent(viewModel.userEmail ?? ''),
                                );
                              },
                              child: Text(
                                AppStrings.resend,
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
