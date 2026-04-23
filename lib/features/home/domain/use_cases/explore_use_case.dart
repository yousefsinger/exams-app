
import 'package:exam_app/config/api/base_response.dart';
import 'package:injectable/injectable.dart';
import '../model/subject.dart';
import '../repository/explore_repo_contract.dart';

@injectable
class ExploreUseCase {
  final ExploreRepoContract _exploreRepoContract;

  ExploreUseCase(this._exploreRepoContract);
  Future<BaseResponse<List<SubjectEntity>>> callAllSubjects() {
    return _exploreRepoContract.getAllSubjects();
  }

}