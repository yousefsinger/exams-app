// lib/features/home/examscreen/presentation/cubit/exam_state.dart

import 'package:equatable/equatable.dart';
import '../../domain/entities/exam_questions_entity.dart';

abstract class ExamState extends Equatable {
  const ExamState();

  @override
  List<Object?> get props => [];
}

class ExamInitial extends ExamState {
  const ExamInitial();
}

class ExamLoading extends ExamState {
  const ExamLoading();
}

class ExamLoaded extends ExamState {
  final List<ExamQuestionEntity> questions;
  final int currentIndex;
  final int remainingSeconds;
  final int totalSeconds;
  final Map<String, List<String>> answers;

  const ExamLoaded({
    required this.questions,
    required this.currentIndex,
    required this.remainingSeconds,
    required this.totalSeconds,
    required this.answers,
  });

  ExamQuestionEntity get currentQuestion => questions[currentIndex];
  bool get isLastQuestion => currentIndex == questions.length - 1;
  List<String> answersFor(String questionId) => answers[questionId] ?? [];

  double get progressValue =>
      questions.isEmpty ? 0 : (currentIndex + 1) / questions.length;

  ExamLoaded copyWith({
    List<ExamQuestionEntity>? questions,
    int? currentIndex,
    int? remainingSeconds,
    int? totalSeconds,
    Map<String, List<String>>? answers,
  }) =>
      ExamLoaded(
        questions: questions ?? this.questions,
        currentIndex: currentIndex ?? this.currentIndex,
        remainingSeconds: remainingSeconds ?? this.remainingSeconds,
        totalSeconds: totalSeconds ?? this.totalSeconds,
        answers: answers ?? this.answers,
      );

  @override
  List<Object?> get props =>
      [questions, currentIndex, remainingSeconds, totalSeconds, answers];
}

class ExamTimeOut extends ExamState {
  final List<ExamQuestionEntity> questions;
  final int currentIndex;
  final int totalSeconds;
  final Map<String, List<String>> answers;

  const ExamTimeOut({
    required this.questions,
    required this.currentIndex,
    required this.totalSeconds,
    required this.answers,
  });

  @override
  List<Object?> get props => [questions, currentIndex, totalSeconds, answers];
}

class ExamFinished extends ExamState {
  final List<ExamQuestionEntity> questions;
  final Map<String, List<String>> answers;

  const ExamFinished({
    required this.questions,
    required this.answers,
  });

  @override
  List<Object?> get props => [questions, answers];
}

class ExamError extends ExamState {
  final String message;

  const ExamError(this.message);

  @override
  List<Object?> get props => [message];
}
