import 'package:equatable/equatable.dart';

import '../../../../../../config/api/base_states.dart';
import '../../../domain/model/subject.dart';

class HomeStates extends Equatable {
  BaseState<List<SubjectEntity>>? getAllSubjectStats;

  HomeStates({
    this.getAllSubjectStats,
  });

  HomeStates copyWith({
    BaseState<List<SubjectEntity>>? getAllSubjectStats,
  }) {
    return HomeStates(
      getAllSubjectStats: getAllSubjectStats ?? this.getAllSubjectStats,
    );
  }

  @override
  List<Object?> get props => [getAllSubjectStats];
}
