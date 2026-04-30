import '../../../../config/api/base_response.dart';
import '../model/exam.dart';

abstract class ExamsRepoContract {
  Future<BaseResponse<List<Exam>>> getExamsBySubject(String subjectId);
}
