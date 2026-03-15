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

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  @override
  void initState() {
    super.initState();

    final viewModel = context.read<ForgetPasswordViewModel>();

    viewModel.verifyCodeController.clear();
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
        color: const Color(0xffDFE7F7),
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.errorColor),
    );

    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(verifyState!.errorMessage!)),
          );
        }

        final resendState = state.resendCodeState;

        if (resendState?.data != null) {

          viewModel.verifyCodeController.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Code sent again')),
          );
        }

        if (resendState?.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(resendState!.errorMessage!)),
          );
        }
      },

      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                viewModel.verifyCodeController.clear();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            title: const Text('Password'),
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),

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

                    const Text("Didn't receive code?"),
                    TextButton(
                      onPressed: () {

                        viewModel.verifyCodeController.clear();

                        viewModel.doIntent(
                          ResendCodeEvent(
                            viewModel.userEmail ?? '',
                          ),
                        );

                      },
                      child: Text(
                        'Resend',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
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