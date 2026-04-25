import 'package:exam_app/core/widgets/custom_elevated_button.dart';
import 'package:exam_app/features/profile/presentation/view_model/profile/profile_events.dart';
import 'package:exam_app/features/profile/presentation/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_strings.dart';
import '../view_model/profile/profile_states.dart';
import '../view_model/profile/profile_view_model.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() =>
      _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<ProfileViewModel>().doIntent(GetUserEvent());
  }

  @override
  void dispose() {
    nameController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModel, ProfileState>(
      builder: (context, state) {
        final vm = context.read<ProfileViewModel>();
        final user = state.getUserState?.data;
        final isEditing = state.isEditing;
        if (user != null && nameController.text.isEmpty) {
          nameController.text = user.userName;
          firstNameController.text = user.firstName;
          lastNameController.text = user.lastName;
          emailController.text = user.email;
          phoneController.text = user.phone;
        }

        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            titleSpacing: 0,
            title: Padding(
              padding:  EdgeInsets.only(left: 16.w),
              child: Text(
                isEditing
                    ? AppStrings.editProfile
                    : AppStrings.profile,
              ),
            ),
            leading: isEditing
                ? IconButton(
              onPressed: () {
                vm.doIntent(DisableEditEvent());
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            )
                : null,
          ),

          body: Builder(
            builder: (_) {
              if (state.getUserState?.isLoading == true) {
                return const Center(
                    child: CircularProgressIndicator());
              }

              if (state.getUserState?.errorMessage != null) {
                return Center(
                  child:
                  Text(state.getUserState!.errorMessage!),
                );
              }

              return SafeArea(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        CircleAvatar(
                          radius: 40,
                          backgroundColor: AppColors.grayColor,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: AppColors.primaryColor,
                          ),
                        ),

                        const SizedBox(height: 20),

                        ProfileForm(
                          nameController: nameController,
                          firstNameController:
                          firstNameController,
                          lastNameController: lastNameController,
                          emailController: emailController,
                          phoneController: phoneController,
                          isEditing: isEditing,
                          onEnableEdit: () {
                            vm.doIntent(EnableEditEvent()); // ✅ FIX
                          },
                        ),

                        const SizedBox(height: 30),

                        BlocConsumer<ProfileViewModel,
                            ProfileState>(
                          listenWhen: (prev, curr) =>
                          prev.updateProfileState !=
                              curr.updateProfileState,
                          listener: (context, state) {
                            final update =
                                state.updateProfileState;

                            if (update?.data != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(AppStrings
                                      .profileUpdatedSuccessfully),
                                ),
                              );
                            }

                            if (update?.errorMessage != null) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                      update!.errorMessage!),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            final isLoading =
                                state.updateProfileState?.isLoading ?? false;

                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: isLoading
                                  ? const Center(
                                child: CircularProgressIndicator(),
                              )
                                  : CustomElevatedButton(
                                text: AppStrings.update,
                                isValid: isEditing,
                                onPressed: isEditing
                                    ? () {
                                  if (formKey.currentState?.validate() ?? false) {
                                    vm.doIntent(
                                      UpdateProfileEvent(
                                        username: nameController.text,
                                        firstName: firstNameController.text,
                                        lastName: lastNameController.text,
                                        email: emailController.text,
                                        phone: phoneController.text,
                                      ),
                                    );
                                  }
                                }
                                    : null,
                              ),
                            );
                          },
                        )],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
