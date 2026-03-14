import 'package:exam_app/config/api/base_states.dart';
import '../../domain/entities/signup_entity.dart';
import '../domain/entities/signup_entity.dart';

abstract class SignUpDataSourceContract {
  Future<BaseResponse> signUp(SignUpEntity entity);
}
