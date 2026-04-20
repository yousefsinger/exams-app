import '../../../../config/api/base_response.dart';
import '../domain/entities/signup_entity.dart';

abstract class SignUpDataSourceContract {
  Future<BaseResponse> signUp(SignUpEntity entity);
}
