
import 'package:injectable/injectable.dart';

import '../../domain/entities/exam_questions_entity.dart';
@injectable

class AnswerOptionModel extends AnswerOptionEntity {
  const AnswerOptionModel({
    required super.id,
    required super.text,
  });

  factory AnswerOptionModel.fromJson(Map<String, dynamic> json) =>
      AnswerOptionModel(
        id: json['key'] as String,
        text: json['answer'] as String,
      );
}

class ExamQuestionModel extends ExamQuestionEntity {
  const ExamQuestionModel({
    required super.id,
    required super.text,
    required super.type,
    required super.options,
    super.correctAnswerIds,
  });

  factory ExamQuestionModel.fromJson(Map<String, dynamic> json) {
    final rawType = (json['type'] as String?) ?? 'single';
    final type = rawType == 'multiple'
        ? QuestionType.multipleChoice
        : QuestionType.singleChoice;

    final options = (json['answers'] as List<dynamic>? ?? [])
        .map((o) => AnswerOptionModel.fromJson(o as Map<String, dynamic>))
        .toList();

    // API returns "correct" as a single key string or list of key strings
    List<String> correctIds = [];
    final correct = json['correct'];
    if (correct is String) {
      correctIds = [correct];
    } else if (correct is List) {
      correctIds = correct.map((e) => e.toString()).toList();
    }

    return ExamQuestionModel(
      id: json['_id'] as String,
      text: json['question'] as String,
      type: type,
      options: options,
      correctAnswerIds: correctIds,
    );
  }
}

/// Top-level wrapper matching: { "questions": [...] }
class ExamQuestionsResponse {
  final List<ExamQuestionModel> questions;

  const ExamQuestionsResponse({required this.questions});

  factory ExamQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      ExamQuestionsResponse(
        questions: (json['questions'] as List<dynamic>? ?? [])
            .map((q) =>
            ExamQuestionModel.fromJson(q as Map<String, dynamic>))
            .toList(),
      );
}
