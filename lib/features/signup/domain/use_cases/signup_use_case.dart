import 'package:exam_app/config/api/base_states.dart';
import '../entities/signup_entity.dart';
import '../repository/signup_repo_contract.dart';

class SignUpUseCase {
  final SignUpRepoContract _repo;

  SignUpUseCase(this._repo);

  Future<BaseResponse> call(SignUpEntity entity) {
    return _repo.signUp(entity);
  }
}
