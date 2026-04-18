import 'package:json_annotation/json_annotation.dart';
import '../../../domain/model/subject.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;
  DateTime? createdAt;

  Category({this.id, this.name, this.icon, this.createdAt});

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
  toDomain() =>
      SubjectEntity(id: id ?? "", name: name ?? "", icon: icon ?? "");
}