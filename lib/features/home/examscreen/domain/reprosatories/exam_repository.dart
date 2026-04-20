// lib/features/home/examscreen/domain/repositories/exam_repository.dart

import 'package:dartz/dartz.dart';
import '../entities/exam_questions_entity.dart';
import '../failure/failures.dart';



abstract class ExamRepository {
  Future<Either<ExamFailure, List<ExamQuestionEntity>>> getExamQuestions(
      String examId,
      );
}
