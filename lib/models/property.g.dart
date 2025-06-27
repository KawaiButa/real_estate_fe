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
      description: json['description'] as String,
      status: json['status'] as bool,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      owner: json['owner'] == null
          ? null
          : User.fromJson(json['owner'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      ownerId: json['owner_id'] as String,
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      sqm: (json['sqm'] as num?)?.toDouble(),
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'description': instance.description,
      'status': instance.status,
      'address': instance.address,
      'owner': instance.owner,
      'created_at': instance.createdAt.toIso8601String(),
      'owner_id': instance.ownerId,
      'average_rating': instance.averageRating,
      'sqm': instance.sqm,
      'reviews': instance.reviews,
      'images': instance.images,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
