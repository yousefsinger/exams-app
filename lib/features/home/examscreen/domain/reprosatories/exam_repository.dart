// lib/features/home/examscreen/domain/repositories/exam_repository.dart

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../entities/exam_questions_entity.dart';

import '../failure/failures.dart';

@injectable

abstract class ExamRepository {
  Future<Either<ExamFailure, List<ExamQuestionEntity>>> getExamQuestions(
      String examId,
      );
}
