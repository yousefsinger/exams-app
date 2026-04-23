import 'package:exam_app/features/profile/domain/model/user_entity.dart';

class UpdateProfileEntity {
  final String message;
  final UserEntity? userData;
   const UpdateProfileEntity({required this.message,  this.userData});
}


