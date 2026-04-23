import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../../core/values/api_constants.dart';
import '../../data/model/subject_response/subject_response.dart';

part 'explore_api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ExploreApiClient {
  @factoryMethod
  factory ExploreApiClient(Dio dio) = _ExploreApiClient;
  @GET(ApiConstants.subjects)
  Future<SubjectResponse> getAllSubjects();
//

}