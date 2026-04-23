import 'package:equatable/equatable.dart';
import 'package:exam_app/config/api/base_states.dart';
import 'package:exam_app/features/home/domain/model/subject.dart';


class ExploreStates extends Equatable {
  final BaseState<List<SubjectEntity>>? getAllSubjectStats;

  const ExploreStates({
    this.getAllSubjectStats,
  });

  ExploreStates copyWith({
    BaseState<List<SubjectEntity>>? getAllSubjectStats,
  }) {
    return ExploreStates(
      getAllSubjectStats: getAllSubjectStats ?? this.getAllSubjectStats,
    );
  }

  @override
  List<Object?> get props => [getAllSubjectStats];
}
