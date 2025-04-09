// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationPostImpl _$$LocationPostImplFromJson(Map<String, dynamic> json) =>
    _$LocationPostImpl(
      city: json['city'] as String,
      count: (json['count'] as num).toInt(),
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$LocationPostImplToJson(_$LocationPostImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'count': instance.count,
      'url': instance.url,
    };
