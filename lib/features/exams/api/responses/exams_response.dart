import 'package:exam_app/features/exams/data/model/metadata_dto.dart';

import '../../data/model/exam_dto.dart';

class ExamsResponse {
  final String? message;
  final MetadataDto? metadata;
  final List<ExamDto>? exams;

  ExamsResponse({this.message, this.metadata, this.exams});

  factory ExamsResponse.fromJson(Map<String, dynamic> json) {
    return ExamsResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] != null
          ? MetadataDto.fromJson(json['metadata'])
          : null,
      exams: json['exams'] != null
          ? (json['exams'] as List).map((e) => ExamDto.fromJson(e)).toList()
          : null,
    );
  }
}
