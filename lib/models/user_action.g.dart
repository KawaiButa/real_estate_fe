// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyVerificationImpl _$$PropertyVerificationImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertyVerificationImpl(
      id: json['id'] as String,
      propertyId: json['property_id'] as String,
      userId: json['user_id'] as String?,
      type: json['type'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PropertyVerificationImplToJson(
        _$PropertyVerificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'user_id': instance.userId,
      'type': instance.type,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
