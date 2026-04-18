// lib/features/home/examscreen/data/repositories/exam_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/handle_error/handle_error.dart';
import '../../domain/entities/exam_questions_entity.dart';
import '../../domain/failure/failures.dart';
import '../../domain/reprosatories/exam_repository.dart';
import '../datasources/exam_remote_datasource.dart';
@injectable

@LazySingleton(as: ExamRepository)
class ExamRepositoryImpl implements ExamRepository {
  final ExamRemoteDataSource _remoteDataSource;

  ExamRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<ExamFailure, List<ExamQuestionEntity>>> getExamQuestions(
      String examId,
      ) async {
    try {
      final questions = await _remoteDataSource.getExamQuestions(examId);
      return Right(questions);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Left(ExamUnauthorizedFailure());
      }
      return Left(ExamServerFailure(ErrorHandler.handleError(e)));
    } catch (e) {
      return Left(ExamServerFailure(e.toString()));
    }
  }
}
