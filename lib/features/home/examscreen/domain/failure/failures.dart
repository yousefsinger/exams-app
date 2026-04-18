// lib/features/home/examscreen/domain/failures/exam_failure.dart

abstract class ExamFailure {
  final String message;
  const ExamFailure(this.message);
}

class ExamServerFailure extends ExamFailure {
  const ExamServerFailure(super.message);
}

class ExamNetworkFailure extends ExamFailure {
  const ExamNetworkFailure(super.message);
}

class ExamUnauthorizedFailure extends ExamFailure {
  const ExamUnauthorizedFailure()
      : super('Session expired. Please log in again.');
}
