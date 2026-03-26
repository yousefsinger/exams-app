import '../../../../../config/api/base_response.dart';
import '../entities/signup_entity.dart';

abstract class SignUpRepoContract {
  Future<BaseResponse> signUp(SignUpEntity entity);
}