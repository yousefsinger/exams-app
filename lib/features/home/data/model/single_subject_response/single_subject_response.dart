import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'single_subject_response.g.dart';

@JsonSerializable()
class SingelSubjectResponse {
  String? message;
  Category? category;

  SingelSubjectResponse({this.message, this.category});

  factory SingelSubjectResponse.fromJson(Map<String, dynamic> json) {
    return _$SingelSubjectResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SingelSubjectResponseToJson(this);
}