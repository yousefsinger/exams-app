import 'package:injectable/injectable.dart';
import '../models/models.dart';
abstract class ExamRemoteDataSource {
  Future<List<ExamQuestionModel>> getExamQuestions(String examId);
}
