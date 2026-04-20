import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/features/profile/domain/model/user_entity.dart';
import 'package:exam_app/features/profile/domain/repository/get_user_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUserUseCase {
  final GetUserRepoContract _getUserRepoContract;

  const GetUserUseCase(this._getUserRepoContract);

  Future<BaseResponse<UserEntity>> call() {
    return _getUserRepoContract.getUser();
  }
}
