import 'package:json_annotation/json_annotation.dart';

import '../../../domain/model/subject.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;
  DateTime? createdAt;

  Subject({this.id, this.name, this.icon, this.createdAt});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return _$SubjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
  SubjectEntity toDomain() =>
      SubjectEntity(name: name ?? "", icon: icon ?? "", id: id ?? "");
}