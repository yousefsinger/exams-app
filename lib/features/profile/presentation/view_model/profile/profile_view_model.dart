import 'package:exam_app/features/profile/presentation/view_model/profile/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../../../../config/api/base_states.dart';
import '../../../data/model/update_profile_request/update_profile_request.dart';
import '../../../domain/model/update_profile_entity.dart';
import '../../../domain/model/user_entity.dart';
import '../../../domain/use_cases/get_user_use_case.dart';
import '../../../domain/use_cases/update_profile_use_case.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  final GetUserUseCase _getUserUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  ProfileViewModel(
    this._getUserUseCase,
    this._updateProfileUseCase,
  ) : super(const ProfileState());

  final nameController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> getUser() async {
    emit(state.copyWith(
      getUserState: const BaseState(isLoading: true),
    ));

    final response = await _getUserUseCase();

    switch (response) {
      case SuccessResponse<UserEntity>():
        final user = response.data;

        nameController.text = user.userName ;
        firstNameController.text = user.firstName ;
        lastNameController.text = user.lastName ;
        emailController.text = user.email ;
        phoneController.text = user.phone ;

        emit(state.copyWith(
          getUserState: BaseState(data: user),
        ));

      case ErrorResponse<UserEntity>():
        emit(state.copyWith(
          getUserState: BaseState(
            errorMessage: response.errorMessage,
          ),
        ));
    }
  }

  void enableEdit() {
    emit(state.copyWith(isEditing: true));
  }

  void disableEdit() {
    emit(state.copyWith(isEditing: false));
  }

  Future<void> updateProfile() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(state.copyWith(
      updateProfileState: const BaseState(isLoading: true),
    ));

    final response = await _updateProfileUseCase.call(
      UpdateProfileRequest(
        username: nameController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text,
      ),
    );

    switch (response) {
      case SuccessResponse<UpdateProfileEntity>():
        emit(state.copyWith(
          updateProfileState: BaseState(data: response.data),
          isEditing: false,
        ));
        emit(state.copyWith(updateProfileState: null));

      case ErrorResponse<UpdateProfileEntity>():
        emit(state.copyWith(
          updateProfileState: BaseState(
            errorMessage: response.errorMessage,
          ),
        ));
    }
  }
}
