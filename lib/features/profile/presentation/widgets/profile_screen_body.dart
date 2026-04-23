import 'package:exam_app/features/profile/presentation/widgets/custom_app_bar.dart';
import 'package:exam_app/features/profile/presentation/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/app_colors.dart';
import '../../../../core/values/app_strings.dart';
import '../view_model/profile/profile_states.dart';
import '../view_model/profile/profile_view_model.dart';
import 'custom_picture.dart';
import 'custom_update_button.dart';

class ProfileScreenBody extends StatefulWidget {
  const ProfileScreenBody({super.key});

  @override
  State<ProfileScreenBody> createState() => _ProfileScreenBodyState();
}

class _ProfileScreenBodyState extends State<ProfileScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileViewModel>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileViewModel, ProfileState>(
      listenWhen: (previous, current) {
        return previous.updateProfileState != current.updateProfileState;
      },
      listener: (context, state) {
        final updateState = state.updateProfileState;

        if (updateState?.data != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(AppStrings.profileUpdatedSuccessfully),
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }

        if (updateState?.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(updateState!.errorMessage!),
              backgroundColor: AppColors.errorColor,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state.getUserState?.isLoading == true) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.getUserState?.errorMessage != null) {
          return Center(
            child: Text(state.getUserState!.errorMessage!),
          );
        }

        final vm = context.read<ProfileViewModel>();
        final isUpdating = state.updateProfileState?.isLoading ?? false;

        return SafeArea(
          child: Form(
            key: vm.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const CustomAppBar(),
                  const CustomPicture(),
                  const SizedBox(height: 20),
                  const ProfileForm(),
                  const SizedBox(height: 20),
                  const CustomUpdateButton(),
                  if (isUpdating)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: CircularProgressIndicator(),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
