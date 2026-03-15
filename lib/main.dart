import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_routes.dart';
import 'package:exam_app/core/values/app_theme.dart';
import 'package:exam_app/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:exam_app/features/auth/forget_password/presentation/screens/otp_screen.dart';
import 'package:exam_app/features/auth/forget_password/presentation/screens/reset_password_screen.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/bloc/forget_password_view_model.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/bloc/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/auth/login/presentation/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ForgetPasswordViewModel>(),
        ),
        BlocProvider(
          create: (_) => getIt<LoginViewModel>(),
        ),
      ],
      child: const ExamApp(),
    ),
  );
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,

          routes: {
            AppRoutes.login: (_) => const LoginScreen(),
            AppRoutes.forgetPassword: (_) => const ForgetPasswordScreen(),
            AppRoutes.otp: (_) => const OtpScreen(),
            AppRoutes.resetPassword: (_) => const ResetPasswordScreen(),
          },
          initialRoute: AppRoutes.login,
        );
      },
    );
  }
}