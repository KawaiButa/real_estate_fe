// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserActionImpl _$$UserActionImplFromJson(Map<String, dynamic> json) =>
    _$UserActionImpl(
      id: json['id'] as String,
      propertyId: json['property_id'] as String,
      userId: json['user_id'] as String?,
      action: json['action'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$UserActionImplToJson(_$UserActionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'user_id': instance.userId,
      'action': instance.action,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
