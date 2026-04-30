sealed class ExamsEvent {}

class GetExamsBySubjectEvent extends ExamsEvent {
  final String subjectId;

  GetExamsBySubjectEvent(this.subjectId);
}
