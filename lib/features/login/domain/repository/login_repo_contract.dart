import '../../../../config/api/base_response.dart';
import '../model/user.dart';

abstract class LoginRepoContract {
  Future<BaseResponse<User>> login(String email, String password,
      bool isRememberMe);
}