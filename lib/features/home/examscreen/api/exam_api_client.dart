// lib/features/home/examscreen/api/exam_api_client.dart

import 'package:dio/dio.dart';
import 'package:exam_app/core/values/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../data/models/models.dart';

part 'exam_api_client.g.dart';
@injectable
@RestApi()
abstract class ExamApiClient {
  factory ExamApiClient(Dio dio, {String? baseUrl}) = _ExamApiClient;

  @GET(ApiConstants.getQuestions)
  Future<ExamQuestionsResponse> getExamQuestions(
      @Query('exam') String examId,
      @Header('token') String token,
      );
}
