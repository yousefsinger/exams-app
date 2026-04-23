import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/app_strings.dart';
import '../view_model/profile/profile_view_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final isEditing = vm.state.isEditing;
    return AppBar(
      title: Text(
        isEditing ? AppStrings.editProfile : AppStrings.profile,
      ),
      titleSpacing: isEditing ? 0 : 16,

      leading: isEditing
          ? IconButton(
        onPressed: () {
          vm.disableEdit();
        },
        icon: const Icon(Icons.arrow_back_ios_new),
      )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}