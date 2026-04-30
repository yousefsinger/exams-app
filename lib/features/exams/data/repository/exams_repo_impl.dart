import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/api/base_response.dart';
import '../../api/data_sources/exams_data_source_contract.dart';
import '../../domain/model/exam.dart';
import '../../domain/repository/exams_repo_contract.dart';
import '../model/exam_dto.dart';

@Injectable(as: ExamsRepoContract)
class ExamsRepoImpl implements ExamsRepoContract {
  final ExamsDataSourceContract dataSource;

  ExamsRepoImpl(this.dataSource);

  @override
  Future<BaseResponse<List<Exam>>> getExamsBySubject(String subjectId) async {
    try {
      final response = await dataSource.getExamsBySubject(subjectId);
      if (response.exams != null) {
        final List<Exam> examsList =
            response.exams!.map((examDto) => examDto.toDomain()).toList();

        return SuccessResponse(data: examsList);
      } else {
        return ErrorResponse(
            errorMessage:
                response.message ?? "there is no exams in this subject..");
      }
    } on DioException catch (e) {
      String errorMessage = "something went wrong please try again later";

      if (e.response != null && e.response?.data != null) {
        errorMessage = e.response?.data['message'] ?? errorMessage;
      }
      return ErrorResponse(errorMessage: errorMessage);
    } catch (e) {
      return ErrorResponse(
          errorMessage: "make sure you have internet connection");
    }
  }
}
