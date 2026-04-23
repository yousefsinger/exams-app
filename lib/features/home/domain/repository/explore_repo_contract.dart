import '../../../../../config/api/base_response.dart';
import '../model/subject.dart';

abstract interface class ExploreRepoContract {
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();

}