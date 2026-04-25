import 'package:exam_app/features/profile/presentation/view_model/profile/profile_events.dart';
import 'package:exam_app/features/profile/presentation/view_model/profile/profile_states.dart';
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

  void doIntent(ProfileEvents event) {
    switch (event) {
      case GetUserEvent():
        _getUser();
        break;

      case UpdateProfileEvent():
        _updateProfile(event);
        break;

      case EnableEditEvent():
        emit(state.copyWith(isEditing: true));
        break;

      case DisableEditEvent():
        emit(state.copyWith(isEditing: false));
        break;
    }
  }

  Future<void> _getUser() async {
    emit(state.copyWith(
      getUserState: const BaseState(isLoading: true),
    ));

    final response = await _getUserUseCase();

    switch (response) {
      case SuccessResponse<UserEntity>():
        emit(state.copyWith(
          getUserState: BaseState(data: response.data),
        ));

      case ErrorResponse<UserEntity>():
        emit(state.copyWith(
          getUserState: BaseState(
            errorMessage: response.errorMessage,
          ),
        ));
    }
  }

  Future<void> _updateProfile(UpdateProfileEvent event) async {
    emit(state.copyWith(
      updateProfileState: const BaseState(isLoading: true),
    ));

    final response = await _updateProfileUseCase.call(
      UpdateProfileRequest(
        username: event.username,
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        phone: event.phone,
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
