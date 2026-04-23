import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/app_strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../view_model/profile/profile_view_model.dart';

class CustomUpdateButton extends StatelessWidget {
  const CustomUpdateButton({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final isEditing = vm.state.isEditing;

    return CustomElevatedButton(
      text: AppStrings.update,
      isValid: isEditing,
      onPressed: () {
        vm.updateProfile();
      },
    );
  }
}