import '../../../../../config/api/base_states.dart';
import '../../../domain/model/exam.dart';

class ExamsStates {
  BaseState<List<Exam>>? examsListState;

  ExamsStates({
    this.examsListState,
  });

  ExamsStates copyWith({
    BaseState<List<Exam>>? examsListState,
  }) {
    return ExamsStates(
      examsListState: examsListState ?? this.examsListState,
    );
  }
}
