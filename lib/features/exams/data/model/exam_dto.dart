import '../../domain/model/exam.dart';

class ExamDto {
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;
  final String? createdAt;

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) {
    return ExamDto(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      duration: json['duration'] as int?,
      subject: json['subject'] as String?,
      numberOfQuestions: json['numberOfQuestions'] as int?,
      active: json['active'] as bool?,
      createdAt: json['createdAt'] as String?,
    );
  }
}

extension ExamMapper on ExamDto {
  Exam toDomain() {
    return Exam(
      id: id ?? '',
      title: title ?? '',
      duration: duration ?? 0,
      subjectId: subject ?? '',
      numberOfQuestions: numberOfQuestions ?? 0,
    );
  }
}
