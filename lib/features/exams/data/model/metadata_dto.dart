import '../../domain/model/metadata.dart';

class MetadataDto {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;

  MetadataDto({this.currentPage, this.numberOfPages, this.limit});

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return MetadataDto(
      currentPage: json['currentPage'] as int?,
      numberOfPages: json['numberOfPages'] as int?,
      limit: json['limit'] as int?,
    );
  }
}

extension MetadataMapper on MetadataDto {
  Metadata toDomain() {
    return Metadata(
      currentPage: currentPage ?? 1,
      numberOfPages: numberOfPages ?? 1,
      limit: limit ?? 40,
    );
  }
}
