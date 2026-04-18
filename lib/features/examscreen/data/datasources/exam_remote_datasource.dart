// lib/features/home/examscreen/data/datasources/exam_remote_datasource.dart

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/cashe/secure_storage.dart';
import '../../api/exam_api_client.dart';
import '../models/models.dart';
import 'exam_datasource.dart';

// ── Implementation ────────────────────────────────────────────────────────

@LazySingleton(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ExamApiClient _apiClient;
  final SecureStorage _secureStorage;

  ExamRemoteDataSourceImpl(this._apiClient, this._secureStorage);

  @override
  Future<List<ExamQuestionModel>> getExamQuestions(String examId) async {
    final token = await _secureStorage.getToken();
    if (token == null || token.isEmpty) {
      throw DioException(
        requestOptions: RequestOptions(path: 'questions'),
        type: DioExceptionType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: 'questions'),
          statusCode: 401,
        ),
      );
    }
    final response = await _apiClient.getExamQuestions(examId, token);
    return response.questions;
  }
}
