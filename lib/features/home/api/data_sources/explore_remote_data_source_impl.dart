import 'dart:async';

import 'package:dio/dio.dart';
import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/core/values/api_errors_constants.dart';
import 'package:exam_app/features/home/api/explore_api_client/explore_api_client.dart';
import 'package:exam_app/features/home/data/data_sources/explore_remote_data_source_contract.dart';
import 'package:exam_app/features/home/data/model/subject_response/subject.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ExploreRemoteDatasourceContract)
class ExploreRemoteDatasourceImpl implements ExploreRemoteDatasourceContract {
  final ExploreApiClient _apiClient;

  ExploreRemoteDatasourceImpl(this._apiClient);
  @override
  Future<BaseResponse<List<Subject>>> getAllSubjects() async {
    try {
      final response = await _apiClient.getAllSubjects();
      List<Subject> data = response.subjects ?? [];
      return SuccessResponse<List<Subject>>(data: data);
    } catch (e) {
      if(e is DioException){
        return ErrorResponse(errorMessage: ApiErrorsConstants.unknownError);
      }
      else if(e is TimeoutException){
        return ErrorResponse(errorMessage: ApiErrorsConstants.connectionTimeoutError);
      }
      return ErrorResponse(errorMessage: ApiErrorsConstants.unknownError);
    }
  }


}