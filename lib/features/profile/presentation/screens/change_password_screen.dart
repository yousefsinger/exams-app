import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../../../../core/values/app_colors.dart';
import '../view_model/change_password/change_password_view_model.dart';
import '../widgets/change_password_screen_body.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => getIt<ChangePasswordViewModel>(),
        child: const Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: ChangePasswordScreenBody(),
        ));
  }
}
