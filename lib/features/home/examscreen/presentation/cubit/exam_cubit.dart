import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecase/get_exam_questions.dart';
import 'exam_state.dart';

@injectable
class ExamCubit extends Cubit<ExamState> {
  final GetExamQuestionsUseCase _getExamQuestionsUseCase;

  Timer? _timer;
  DateTime? _endTime;

  ExamCubit(this._getExamQuestionsUseCase) : super(const ExamInitial());

  // ── Load ──────────────────────────────────────────────────────────────────

  Future<void> loadExam({
    required String examId,
    required int durationInSeconds,
  }) async {
    _timer?.cancel();
    emit(const ExamLoading());

    final result = await _getExamQuestionsUseCase(examId);

    if (isClosed) return;

    result.fold(
          (failure) => emit(ExamError(failure.message)),
          (questions) {
        if (questions.isEmpty) {
          emit(const ExamError("No questions found"));
          return;
        }

        emit(ExamLoaded(
          questions: questions,
          currentIndex: 0,
          remainingSeconds: durationInSeconds,
          totalSeconds: durationInSeconds,
          answers: const <String, List<String>>{},
        ));

        _startTimer(durationInSeconds);
      },
    );
  }

  // ── Timer (Fixed) ──────────────────────────────────────────────────────────

  void _startTimer(int durationInSeconds) {
    _timer?.cancel();

    _endTime = DateTime.now().add(
      Duration(seconds: durationInSeconds),
    );

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final current = state;

      if (current is! ExamLoaded) {
        _timer?.cancel();
        return;
      }

      final remaining =
          _endTime!.difference(DateTime.now()).inSeconds;

      if (remaining <= 0) {
        _timer?.cancel();
        emit(ExamTimeOut(
          questions: current.questions,
          currentIndex: current.currentIndex,
          totalSeconds: current.totalSeconds,
          answers: current.answers,
        ));
      } else {
        emit(current.copyWith(remainingSeconds: remaining));
      }
    });
  }

  // ── Answer selection ───────────────────────────────────────────────────────

  void selectSingleAnswer(String questionId, String answerId) {
    final current = state;
    if (current is! ExamLoaded) return;

    final updated = Map<String, List<String>>.from(current.answers);
    updated[questionId] = [answerId];

    emit(current.copyWith(answers: updated));
  }

  void toggleMultiAnswer(String questionId, String answerId) {
    final current = state;
    if (current is! ExamLoaded) return;

    final updated = Map<String, List<String>>.from(current.answers);
    final selected = List<String>.from(updated[questionId] ?? []);

    if (selected.contains(answerId)) {
      selected.remove(answerId);
    } else {
      selected.add(answerId);
    }

    updated[questionId] = selected;

    emit(current.copyWith(answers: updated));
  }

  // ── Navigation ─────────────────────────────────────────────────────────────

  void nextQuestion() {
    final current = state;
    if (current is! ExamLoaded) return;

    if (!current.isLastQuestion) {
      emit(current.copyWith(currentIndex: current.currentIndex + 1));
    }
  }

  void previousQuestion() {
    final current = state;
    if (current is! ExamLoaded) return;

    if (current.currentIndex > 0) {
      emit(current.copyWith(currentIndex: current.currentIndex - 1));
    }
  }

  // ── Submit manually ────────────────────────────────────────────────────────

  void submitExam() {
    final current = state;
    if (current is! ExamLoaded) return;

    _finishExam(current);
  }

  // ── Timeout → Finish ───────────────────────────────────────────────────────

  void submitAfterTimeout() {
    final current = state;
    if (current is! ExamTimeOut) return;

    emit(ExamFinished(
      questions: current.questions,
      answers: current.answers,
    ));
  }

  // ── Finish ─────────────────────────────────────────────────────────────────

  void _finishExam(ExamLoaded current) {
    _timer?.cancel();

    emit(ExamFinished(
      questions: current.questions,
      answers: current.answers,
    ));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}