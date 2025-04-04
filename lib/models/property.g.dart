// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      propertyCategory: json['property_category'] as String,
      transactionType: json['transaction_type'] as String,
      price: (json['price'] as num).toDouble(),
      bedrooms: (json['bedrooms'] as num).toInt(),
      bathrooms: (json['bathrooms'] as num).toInt(),
      propertyTypeId: json['property_type_id'] as String,
      propertyType:
          PropertyType.fromJson(json['property_type'] as Map<String, dynamic>),
      sqm: (json['sqm'] as num?)?.toDouble(),
      description: json['description'] as String,
      status: json['status'] as bool,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      owner: User.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'property_category': instance.propertyCategory,
      'transaction_type': instance.transactionType,
      'price': instance.price,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'property_type_id': instance.propertyTypeId,
      'property_type': instance.propertyType,
      'sqm': instance.sqm,
      'description': instance.description,
      'status': instance.status,
      'address': instance.address,
      'images': instance.images,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
