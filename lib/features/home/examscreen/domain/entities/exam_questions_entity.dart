// lib/features/home/examscreen/domain/entities/exam_question_entity.dart



enum QuestionType { singleChoice, multipleChoice }

class AnswerOptionEntity {
  final String id;
  final String text;

  const AnswerOptionEntity({
    required this.id,
    required this.text,
  });
}

class ExamQuestionEntity {
  final String id;
  final String text;
  final QuestionType type;
  final List<AnswerOptionEntity> options;
  final List<String> correctAnswerIds;

  const ExamQuestionEntity({
    required this.id,
    required this.text,
    required this.type,
    required this.options,
    this.correctAnswerIds = const [],
  });
}
