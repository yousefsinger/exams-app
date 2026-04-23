import 'dart:async';
import 'package:exam_app/config/api/base_response.dart';
import 'package:exam_app/config/api/base_states.dart';
import 'package:exam_app/features/home/domain/model/subject.dart';
import 'package:exam_app/features/home/domain/use_cases/explore_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'explore_events.dart';
import 'home_states.dart';

@injectable
class HomeViewModel extends Cubit<ExploreStates> {
  final ExploreUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase) : super(ExploreStates());

  List<SubjectEntity> _allSubjects = [];

  Timer? _debounce;

  void doIntent(ExploreEvents event) {
    switch (event) {
      case GetAllSubjectsEvent():
        _getAllSubjects();
        break;
      case SearchSubjectsEvent(:final query):
        _searchSubjects(query);
        break;
    }
  }

  Future<void> _getAllSubjects() async {
    emit(
      state.copyWith(
        getAllSubjectStats: BaseState<List<SubjectEntity>>(isLoading: true),
      ),
    );

    final response = await _homeUseCase.callAllSubjects();

    switch (response) {
      case SuccessResponse<List<SubjectEntity>>():
        _allSubjects = response.data;

        emit(
          state.copyWith(
            getAllSubjectStats: BaseState<List<SubjectEntity>>(
              data: _allSubjects,
              isLoading: false,
            ),
          ),
        );

      case ErrorResponse<List<SubjectEntity>>():
        emit(
          state.copyWith(
            getAllSubjectStats: BaseState<List<SubjectEntity>>(
              errorMessage: response.errorMessage,
              isLoading: false,
            ),
          ),
        );
    }
  }

  void _searchSubjects(String query) {
    final normalizedQuery = query.trim().toLowerCase();

    List<SubjectEntity> filtered;

    if (normalizedQuery.isEmpty) {
      filtered = _allSubjects;
    } else {
      filtered = _allSubjects.where((subject) {
        final name = (subject.name).toLowerCase();
        return name.contains(normalizedQuery);
      }).toList();
    }

    emit(
      state.copyWith(
        getAllSubjectStats: BaseState<List<SubjectEntity>>(
          data: filtered,
          isLoading: false,
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
