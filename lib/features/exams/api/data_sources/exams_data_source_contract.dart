import '../../api/responses/exams_response.dart';

abstract class ExamsDataSourceContract {
  Future<ExamsResponse> getExamsBySubject(String subjectId);
}
