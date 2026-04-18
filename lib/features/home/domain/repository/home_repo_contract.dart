import '../../../../../config/api/base_response.dart';
import '../model/subject.dart';

abstract interface class HomeRepoContract {
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects();

}