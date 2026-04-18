// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_subject_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingelSubjectResponse _$SingelSubjectResponseFromJson(
        Map<String, dynamic> json) =>
    SingelSubjectResponse(
      message: json['message'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingelSubjectResponseToJson(
        SingelSubjectResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'category': instance.category,
    };
