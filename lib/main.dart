import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_routes.dart';
import 'package:exam_app/core/values/app_theme.dart';
import 'package:exam_app/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:exam_app/features/auth/forget_password/presentation/screens/otp_screen.dart';
import 'package:exam_app/features/auth/forget_password/presentation/screens/reset_password_screen.dart';
import 'package:exam_app/features/auth/forget_password/presentation/view_model/bloc/forget_password_view_model.dart';
import 'package:exam_app/features/auth/login/presentation/view_model/bloc/login_view_model.dart';
import 'package:exam_app/features/home/presentation/screens/home_screen.dart';
import 'package:exam_app/features/home/presentation/view_model/bloc/home_view_model.dart';
import 'package:exam_app/features/score/presentation/screen/exam_score_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/auth/login/presentation/screens/login_screen.dart';
import 'features/auth/signup/presentation/cubit/signup_cubit.dart';
import 'features/auth/signup/presentation/pages/sign_up_screen.dart';
import 'features/exams/presentation/screens/exam_instructions_screen.dart';
import 'features/exams/presentation/screens/exams_screen.dart';
import 'features/examscreen/presentation/cubit/exam_cubit.dart';
import 'features/examscreen/presentation/screen/exam_screen.dart';
import 'features/profile/presentation/screens/change_password_screen.dart';
import 'features/profile/presentation/view_model/profile/profile_view_model.dart';

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
        BlocProvider(
          create: (_) => getIt<SignUpCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<HomeViewModel>(),
        ),
        BlocProvider(
          create: (_) => getIt<ProfileViewModel>(),
        ),
        BlocProvider(
          create: (_) => getIt<ExamCubit>(),
        )
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
            AppRoutes.signUp: (_) => const SignUpScreen(),
            AppRoutes.forgetPassword: (_) => const ForgetPasswordScreen(),
            AppRoutes.otp: (_) => const OtpScreen(),
            AppRoutes.resetPassword: (_) => const ResetPasswordScreen(),
            AppRoutes.home: (_) => const HomeScreen(),
            AppRoutes.changePasswordScreen: (_) => const ChangePasswordScreen(),
            AppRoutes.examScreen: (ctx) {
              final args =
              ModalRoute.of(ctx)!.settings.arguments as ExamArgs;
              return ExamScreen(args: args);
            },
            AppRoutes.examScore: (ctx) {
              final raw = ModalRoute.of(ctx)!.settings.arguments
                  as Map<String, dynamic>;
              return ExamScoreScreen(
                args: ExamScoreArgs(
                  questions: raw['questions'],
                  answers: raw['answers'],
                  examArgs: raw['examArgs'] as ExamArgs,
                ),
              );
            },
            AppRoutes.exams: (context) {
              final args = ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
              return ExamsScreen(
                subjectId: args['subjectId'],
                subjectName: args['subjectName'],
              );
            },
            AppRoutes.examInstructions: (context) {
              final args = ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>;
              return ExamInstructionsScreen(
                exam: args['exam'],
                subjectName: args['subjectName'],
              );
            },
          },

          initialRoute: AppRoutes.login,
        );
      },
    );
  }
}
