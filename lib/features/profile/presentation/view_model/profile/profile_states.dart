import 'package:equatable/equatable.dart';

import '../../../../../config/api/base_states.dart';
import '../../../domain/model/update_profile_entity.dart';
import '../../../domain/model/user_entity.dart';

class ProfileState extends Equatable {
  final BaseState<UserEntity>? getUserState;
  final BaseState<UpdateProfileEntity>? updateProfileState;

  final bool isEditing;

  const ProfileState({
    this.getUserState,
    this.updateProfileState,
    this.isEditing = false,
  });

  ProfileState copyWith({
    BaseState<UserEntity>? getUserState,
    BaseState<UpdateProfileEntity>? updateProfileState,
    bool? isEditing,
  }) {
    return ProfileState(
      getUserState: getUserState ?? this.getUserState,
      updateProfileState: updateProfileState ?? this.updateProfileState,
      isEditing: isEditing ?? this.isEditing,
    );
  }

  @override
  List<Object?> get props => [
        getUserState,
        updateProfileState,
        isEditing,
      ];
}
