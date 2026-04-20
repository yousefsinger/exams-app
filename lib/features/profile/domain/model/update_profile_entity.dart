import 'package:exam_app/features/profile/domain/model/user_entity.dart';

class UpdateProfileEntity {
  final String message;
  final UserEntity? user;
   const UpdateProfileEntity({required this.message,  this.user});
}


