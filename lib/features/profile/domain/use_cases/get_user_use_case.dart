import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/features/profile/domain/model/user_entity.dart';
import 'package:injectable/injectable.dart';

import '../repository/profile_repo_contract.dart';

@injectable
class GetUserUseCase {
  final ProfileRepoContract _getUserRepoContract;

  const GetUserUseCase(this._getUserRepoContract);

  Future<BaseResponse<UserEntity>> call() {
    return _getUserRepoContract.getUser();
  }
}
