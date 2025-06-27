// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaginatedMetadataImpl _$$PaginatedMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaginatedMetadataImpl(
      limit: (json['limit'] as num).toInt(),
      offset: (json['offset'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$PaginatedMetadataImplToJson(
        _$PaginatedMetadataImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'offset': instance.offset,
      'total': instance.total,
    };
