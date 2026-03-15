import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/app_routes.dart';
import 'package:exam_app/core/values/app_theme.dart';
import 'package:exam_app/features/signup/presentation/pages/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDI();
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: signup,
        routes: {
          signup: (_) => const SignUpScreen(),
           //login: (_) => const LoginScreen(),
        },
      ),
      builder: (context, child) => child!,
    );
  }
}

