import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/features/home/data/data_sources/explore_remote_data_source_contract.dart';
import 'package:exam_app/features/home/data/model/subject_response/subject.dart';
import 'package:exam_app/features/home/domain/model/subject.dart';
import 'package:exam_app/features/home/domain/repository/explore_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ExploreRepoContract)
class ExploreRepoImpl implements ExploreRepoContract {
  final ExploreRemoteDatasourceContract _exploreRemoteDatasourceContract;

  ExploreRepoImpl(this._exploreRemoteDatasourceContract);
  @override
  Future<BaseResponse<List<SubjectEntity>>> getAllSubjects() async {
    BaseResponse<List<Subject>> subjectsResponse =
    await _exploreRemoteDatasourceContract.getAllSubjects();
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