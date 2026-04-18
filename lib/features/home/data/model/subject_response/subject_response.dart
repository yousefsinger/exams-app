import 'package:json_annotation/json_annotation.dart';
import 'metadata.dart';
import 'subject.dart';

part 'subject_response.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectResponse {
  final String? message;
  final Metadata? metadata;

  final List<Subject>? subjects;

  SubjectResponse({this.message, this.metadata, this.subjects});

  factory SubjectResponse.fromJson(Map<String, dynamic> json) =>
      _$SubjectResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectResponseToJson(this);
}