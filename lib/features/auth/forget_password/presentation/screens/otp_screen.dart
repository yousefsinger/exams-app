import 'package:exam_app/core/values/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_styles.dart';
import '../view_model/bloc/forget_password_events.dart';
import '../view_model/bloc/forget_password_states.dart';
import '../view_model/bloc/forget_password_view_model.dart';
import '../widgets/custom_forget_password_text_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();

    final defaultPinTheme = PinTheme(
      width: 74.h,
      height: 68.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      textStyle: AppStyles.medium20Black,
      decoration: BoxDecoration(
        color: const Color(0xffDFE7F7),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.errorColor),
    );

    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
      previous.verifyResetCodeState != current.verifyResetCodeState,

      listener: (context, state) {
        final verifyState = state.verifyResetCodeState;

        if (verifyState?.data != null) {
          Navigator.pushNamed(context, AppRoutes.resetPassword);
        }

        if (verifyState?.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(verifyState!.errorMessage!)),
          );
        }
      },

      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            title: const Text("Password"),
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),

            child: Column(
              children: [
                CustomForgetPasswordTextWidget(
                  text1: 'Email verification',
                  text2:
                  'Please enter your code that send to your\n email address',
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),

                  child: Pinput(
                    controller: viewModel.verifyCodeController,
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    errorPinTheme: errorPinTheme,

                    onCompleted: (code) {

                      viewModel.doIntent(
                        VerifyCodeEvent(
                          viewModel.userEmail ?? '',
                          code,
                        ),
                      );

                    },
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Didn't receive code? "),

                    TextButton(
                      onPressed: () {

                        viewModel.doIntent(
                          ResendCodeEvent(
                            viewModel.userEmail ?? '',
                          ),
                        );

                      },
                      child:  Text(
                        "Resend",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}