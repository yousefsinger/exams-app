import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'single_subject_response.g.dart';

@JsonSerializable()
class SingleSubjectResponse {
  String? message;
  Category? category;

  SingleSubjectResponse({this.message, this.category});

  factory SingleSubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SingleSubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SingleSubjectResponseToJson(this);
}