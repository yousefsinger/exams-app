import 'package:injectable/injectable.dart';

import '../../../../config/api/base_response.dart';
import '../model/exam.dart';
import '../repository/exams_repo_contract.dart';

@injectable
class GetExamsBySubjectUseCase {
  final ExamsRepoContract repository;

  GetExamsBySubjectUseCase(this.repository);

  Future<BaseResponse<List<Exam>>> call(String subjectId) async {
    return await repository.getExamsBySubject(subjectId);
  }
}
