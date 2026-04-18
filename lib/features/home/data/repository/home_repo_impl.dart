
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../api/home_api_client/home_api_client.dart';
import '../../domain/model/subject.dart';
import '../../domain/repository/home_repo_contract.dart';
import '../data_sources/home_remote_data_source_contract.dart';
import '../model/subject_response/subject.dart';

@Injectable(as: HomeRepoContract)
class HomeRepoImple implements HomeRepoContract {
  final HomeRemoteDatasourceContract _homeRemoteDatasourceContract;

  HomeRepoImple(this._homeRemoteDatasourceContract);
  @override
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects() async {
    BaseResponse<List<Subject>> subjectsResponse =
    await _homeRemoteDatasourceContract.getAllSubjects();
    switch (subjectsResponse) {
      case SuccessResponse<List<Subject>>():
        List<Subject> subjectsDTOs = subjectsResponse.data;
        List<SubjectEntity> subjects = subjectsDTOs
            .map((e) => e.toDomain())
            .toList();
        return SuccessResponse<List<SubjectEntity>>(data: subjects);
      case ErrorResponse<List<Subject>>():
        return ErrorResponse<List<SubjectEntity>>(
          errorMessage: subjectsResponse.errorMessage,
        );
    }
  }


}