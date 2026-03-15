import 'package:exam_app/config/api/base_states.dart';
import '../entities/signup_entity.dart';

abstract class SignUpRepoContract {
  Future<BaseResponse> signUp(SignUpEntity entity);
}