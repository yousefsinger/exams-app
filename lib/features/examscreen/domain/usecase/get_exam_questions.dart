import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/exam_questions_entity.dart';
import '../failure/failures.dart';
import '../reprosatories/exam_repository.dart';

@lazySingleton
class GetExamQuestionsUseCase {
  final ExamRepository _repository;

  const GetExamQuestionsUseCase(this._repository);

  Future<Either<ExamFailure, List<ExamQuestionEntity>>> call(String examId) {
    return _repository.getExamQuestions(examId);
  }
}
