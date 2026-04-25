import 'package:equatable/equatable.dart';
import 'package:exam_app/features/profile/domain/model/user_entity.dart';

class UpdateProfileEntity extends Equatable{
  final String message;
  final UserEntity? userData;
   const UpdateProfileEntity({required this.message,  this.userData});

  @override
  List<Object?> get props => [message,userData];
}


