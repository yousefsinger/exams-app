import '../../../../../config/api/base_response.dart';
import '../model/subject_response/subject.dart';

abstract interface class HomeRemoteDatasourceContract {
  Future<BaseResponse<List<Subject>>> getAllSubjects();
}
