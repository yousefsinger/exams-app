import '../../../../config/api/base_response.dart';
import '../entities/signup_entity.dart';
import '../repository/signup_repo_contract.dart';

class SignUpUseCase {
  final SignUpRepoContract _repo;

  SignUpUseCase(this._repo);

  Future<BaseResponse> call(SignUpEntity entity) {
    return _repo.signUp(entity);
  }
}
