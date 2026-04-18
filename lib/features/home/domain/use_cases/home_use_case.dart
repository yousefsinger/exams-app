
import 'package:injectable/injectable.dart';
import '../../../../../config/api/base_response.dart';
import '../model/subject.dart';
import '../repository/home_repo_contract.dart';

@injectable
class HomeUseCase {
  final HomeRepoContract _homeRepoContract;

  HomeUseCase(this._homeRepoContract);
  Future<BaseResponse<List<SubjectEntity>>> callAllSubjects() {
    return _homeRepoContract.getAllSubjects();
  }

}