import 'package:injectable/injectable.dart';

import '../../../../config/api/base_response.dart';
import '../model/user.dart';
import '../repository/login_repo_contract.dart';

@injectable
class LoginUseCase {
  final LoginRepoContract repository;

  LoginUseCase(this.repository);

  Future<BaseResponse<User>> call(
    String email,
    String password,
    bool isRememberMe,
  ) async {
    return await repository.login(email, password, isRememberMe);
  }
}
