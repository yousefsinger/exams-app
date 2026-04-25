import 'package:exam_app/features/profile/presentation/widgets/password_stars.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/app_routes.dart';
import '../../../../core/values/app_strings.dart';
import '../../../../core/values/validators.dart';
import '../../../../core/widgets/custome_text_field.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({
    super.key,
    required this.nameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.isEditing,
    required this.onEnableEdit,
  });

  final TextEditingController nameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  final bool isEditing;
  final VoidCallback onEnableEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: nameController,
          label: AppStrings.userName,
          readOnly: !isEditing,
          onTap: () {
            if (!isEditing) onEnableEdit();
          },
          validator: isEditing ? AppValidators.validateUsername : null,
        ),

        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: firstNameController,
                label: AppStrings.firstName,
                readOnly: !isEditing,
                onTap: () {
                  if (!isEditing) onEnableEdit();
                },
                validator:
                isEditing ? AppValidators.validateFullName : null,
              ),
            ),
            Expanded(
              child: CustomTextField(
                controller: lastNameController,
                label: AppStrings.lastName,
                readOnly: !isEditing,
                onTap: () {
                  if (!isEditing) onEnableEdit();
                },
                validator:
                isEditing ? AppValidators.validateFullName : null,
              ),
            ),
          ],
        ),

        CustomTextField(
          controller: emailController,
          label: AppStrings.email,
          readOnly: !isEditing,
          onTap: () {
            if (!isEditing) onEnableEdit();
          },
          validator: isEditing ? AppValidators.validateEmail : null,
        ),

        CustomTextField(
          controller: phoneController,
          label: AppStrings.phoneNumber,
          readOnly: !isEditing,
          onTap: () {
            if (!isEditing) onEnableEdit();
          },
          validator:
          isEditing ? AppValidators.validatePhoneNumber : null,
        ),

        CustomTextField(
          label: AppStrings.password,
          readOnly: true,
          onTap: () {
            if (!isEditing) onEnableEdit();
          },
          prefixIcon: const PasswordStars(),
          suffixIcon: TextButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, AppRoutes.changePasswordScreen);
            },
            child: Text(AppStrings.change),
          ),
        ),
      ],
    );
  }
}
