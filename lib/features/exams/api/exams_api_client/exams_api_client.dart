import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/values/api_constants.dart';
import '../responses/exams_response.dart';

part 'exams_api_client.g.dart';

@injectable
@RestApi()
abstract class ExamsApiClient {
  @factoryMethod
  factory ExamsApiClient(Dio dio) = _ExamsApiClient;

  @GET(ApiConstants.examsOnSubject)
  Future<ExamsResponse> getExamsBySubject(
    @Query("subject") String subjectId,
  );
}
