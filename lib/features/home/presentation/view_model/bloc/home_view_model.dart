import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../config/api/base_response.dart';
import '../../../../../../config/api/base_states.dart';

import '../../../domain/model/subject.dart';
import '../../../domain/use_cases/home_use_case.dart';
import 'home_events.dart';
import 'home_states.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase) : super(HomeStates());

  List<SubjectEntity> _allSubjects = [];

  Timer? _debounce;

  void doIntent(HomeEvents event) {
    switch (event) {
      case GetAllSubjectsEvent():
        _getAllSubjects();
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
        _allSubjects = response.data ?? [];

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

  void searchSubjects(String query) {
    final normalizedQuery = query.trim().toLowerCase();

    List<SubjectEntity> filtered;

    if (normalizedQuery.isEmpty) {
      filtered = _allSubjects;
    } else {
      filtered = _allSubjects.where((subject) {
        final name = (subject.name ?? '').toLowerCase();
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

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 300), () {
      searchSubjects(query);
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
