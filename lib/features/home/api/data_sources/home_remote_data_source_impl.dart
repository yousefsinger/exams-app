
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../data/data_sources/home_remote_data_source_contract.dart';
import '../../data/model/subject_response/subject.dart';
import '../home_api_client/home_api_client.dart';

@Injectable(as: HomeRemoteDatasourceContract)
class HomeRemoteDatasourceImpe implements HomeRemoteDatasourceContract {
  final HomeApiClient _ApiClient;

  HomeRemoteDatasourceImpe(this._ApiClient);
  @override
  Future<BaseResponse<List<Subject>>> getAllSubjects() async {
    try {
      final response = await _ApiClient.getAllSubjects();
      List<Subject> data = response.subjects ?? [];
      return SuccessResponse<List<Subject>>(data: data);
    } catch (e) {
      return ErrorResponse(errorMessage: e.toString());
    }
  }


}