import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/features/profile/domain/model/user_entity.dart';

abstract interface class GetUserRepoContract {
  Future<BaseResponse<UserEntity>> getUser();
}