import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_routes.dart';
import 'package:exam_app/core/values/app_theme.dart';
import 'package:exam_app/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:exam_app/features/auth/login/presentation/screens/login_screen.dart';
import 'package:exam_app/features/auth/signup/presentation/pages/sign_up_screen.dart';
import 'package:exam_app/features/home/examscreen/presentation/screen/exam_screen.dart';
import 'package:exam_app/features/home/screens/home_screen.dart';
import 'package:exam_app/features/score/presentation/screen/exam_score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const ExamApp());
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

          home: ExamScreen(
            args: ExamArgs(
              examId: 'YOUR_EXAM_ID',
              examTitle: 'Test Exam',
              durationInSeconds: 600,
            ),
          ),
          routes: {
            AppRoutes.login: (_) => const LoginScreen(),
            AppRoutes.signUp: (_) => const SignUpScreen(),
            AppRoutes.forgetPassword: (_) => const ForgetPasswordScreen(),
            AppRoutes.home: (_) => const HomeScreen(),
            AppRoutes.examscreen: (ctx) {
              final args =
              ModalRoute.of(ctx)!.settings.arguments as ExamArgs;
              return ExamScreen(args: args);
            },
            AppRoutes.examScore: (ctx) {
              final args =
              ModalRoute.of(ctx)!.settings.arguments as ExamScoreArgs;
              return ExamScoreScreen(args: args);
            },
          },
        );
      },
    );
  }
}
