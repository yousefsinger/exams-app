import 'package:injectable/injectable.dart';

import '../../api/data_sources/exams_data_source_contract.dart';
import '../../api/exams_api_client/exams_api_client.dart';
import '../../api/responses/exams_response.dart';

@Injectable(as: ExamsDataSourceContract)
class ExamsDataSourceImpl implements ExamsDataSourceContract {
  final ExamsApiClient apiClient;

  ExamsDataSourceImpl(this.apiClient);

  @override
  Future<ExamsResponse> getExamsBySubject(String subjectId) async {
    return await apiClient.getExamsBySubject(subjectId);
  }
}
