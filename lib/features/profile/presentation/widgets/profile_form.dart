import 'package:exam_app/core/values/app_styles.dart';
import 'package:exam_app/features/profile/presentation/widgets/password_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/app_routes.dart';
import '../../../../core/values/app_strings.dart';
import '../../../../core/values/validators.dart';
import '../../../../core/widgets/custome_text_field.dart';
import '../view_model/profile/profile_view_model.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();
    final isEditing = vm.state.isEditing;

    return Column(
      children: [
        CustomTextField(
          controller: vm.nameController,
          label: AppStrings.userName,
          readOnly: !isEditing,
          onTap: () {
            if (!isEditing) vm.enableEdit();
          },
          validator: isEditing ? AppValidators.validateUsername : null,
        ),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: vm.firstNameController,
                label: AppStrings.firstName,
                readOnly: !isEditing,
                onTap: () {
                  if (!isEditing) vm.enableEdit();
                },
                validator: isEditing ? AppValidators.validateFullName : null,
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: vm.lastNameController,
                label: AppStrings.lastName,
                readOnly: !isEditing,
                onTap: () {
                  if (!isEditing) vm.enableEdit();
                },
                validator: isEditing ? AppValidators.validateFullName : null,
              ),
            ),
          ],
        ),
        CustomTextField(
          controller: vm.emailController,
          label: AppStrings.email,
          readOnly: !isEditing,
          onTap: () {
            if (!isEditing) vm.enableEdit();
          },
          validator: isEditing ? AppValidators.validateEmail : null,
        ),
        CustomTextField(
          controller: vm.phoneController,
          label: AppStrings.phoneNumber,
          readOnly: !isEditing,
          onTap: () {
            if (!isEditing) vm.enableEdit();
          },
          validator: isEditing ? AppValidators.validatePhoneNumber : null,
        ),
        CustomTextField(
          label: AppStrings.password,
          readOnly: true,
          onTap: () {
            if (!isEditing) vm.enableEdit();
          },
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: PasswordStars(),
          ),
          suffixIcon: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.changePasswordScreen);
            },
            child: Text(
              AppStrings.change,
              style: AppStyles.regular12Primary,
            ),
          ),
        ),
      ],
    );
  }
}
