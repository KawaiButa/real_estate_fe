// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tourview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TourviewImpl _$$TourviewImplFromJson(Map<String, dynamic> json) =>
    _$TourviewImpl(
      id: json['id'] as String,
      propertyId: json['property_id'] as String,
      imageId: json['image_id'] as String,
      name: json['name'] as String,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TourviewImplToJson(_$TourviewImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'image_id': instance.imageId,
      'name': instance.name,
      'image': instance.image,
      'property': instance.property,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
