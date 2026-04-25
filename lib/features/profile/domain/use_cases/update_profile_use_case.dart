import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/features/profile/data/model/update_profile_request/update_profile_request.dart';
import 'package:exam_app/features/profile/domain/model/update_profile_entity.dart';
import 'package:injectable/injectable.dart';

import '../repository/profile_repo_contract.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepoContract _profileRepoContract;

  const UpdateProfileUseCase(this._profileRepoContract);

  Future<BaseResponse<UpdateProfileEntity>> call(UpdateProfileRequest request) {
    return _profileRepoContract.updateProfile(request);
  }
}
