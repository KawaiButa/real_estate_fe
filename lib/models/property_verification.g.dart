// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyVerificationImpl _$$PropertyVerificationImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertyVerificationImpl(
      id: json['id'] as String,
      propertyId: json['property_id'] as String,
      userId: json['user_id'] as String,
      verificationMethod: json['verification_method'] as String,
      verificationCode: json['verification_code'] as String,
      property: Property.fromJson(json['property'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PropertyVerificationImplToJson(
        _$PropertyVerificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_id': instance.propertyId,
      'user_id': instance.userId,
      'verification_method': instance.verificationMethod,
      'verification_code': instance.verificationCode,
      'property': instance.property,
      'user': instance.user,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
