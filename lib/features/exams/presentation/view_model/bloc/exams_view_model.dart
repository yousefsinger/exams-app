import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/api/base_response.dart';
import '../../../../../config/api/base_states.dart';
import '../../../domain/model/exam.dart';
import '../../../domain/use_cases/get_exams_by_subject_use_case.dart';
import 'exams_events.dart';
import 'exams_states.dart';

@injectable
class ExamsViewModel extends Cubit<ExamsStates> {
  final GetExamsBySubjectUseCase _getExamsUseCase;

  ExamsViewModel(this._getExamsUseCase) : super(ExamsStates());

  void doIntent(ExamsEvent event) {
    switch (event) {
      case GetExamsBySubjectEvent():
        _getExams(event);
    }
  }

  Future<void> _getExams(GetExamsBySubjectEvent event) async {
    emit(
      state.copyWith(
        examsListState: BaseState<List<Exam>>(isLoading: true),
      ),
    );

    final response = await _getExamsUseCase.call(event.subjectId);

    switch (response) {
      case SuccessResponse<List<Exam>>():
        emit(
          state.copyWith(
            examsListState: BaseState<List<Exam>>(
              isLoading: false,
              data: response.data,
            ),
          ),
        );
      case ErrorResponse<List<Exam>>():
        emit(
          state.copyWith(
            examsListState: BaseState<List<Exam>>(
              isLoading: false,
              errorMessage: response.errorMessage,
            ),
          ),
        );
    }
  }
}
