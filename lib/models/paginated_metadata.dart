import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_metadata.freezed.dart';
part 'paginated_metadata.g.dart';

@freezed
class PaginatedMetadata with _$PaginatedMetadata {
  const factory PaginatedMetadata(
      {required int limit,
      required int offset,
      required int total}) = _PaginatedMetadata;
  factory PaginatedMetadata.fromJson(Map<String, dynamic> json) =>
      _$PaginatedMetadataFromJson(json);
}
