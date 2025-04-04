// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartnerRegistrationImpl _$$PartnerRegistrationImplFromJson(
        Map<String, dynamic> json) =>
    _$PartnerRegistrationImpl(
      userId: json['user_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
      profileImage: json['profile_image'] == null
          ? null
          : Image.fromJson(json['profile_image'] as Map<String, dynamic>),
      type: $enumDecode(_$PartnerTypeEnumMap, json['type']),
      businessRegistrationCertificateImages:
          (json['business_registration_certificate_images'] as List<dynamic>?)
                  ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
      taxId: json['tax_id'] as String?,
      authorizedRepresentativeName:
          json['authorized_representative_name'] as String?,
      approved: json['approved'] as bool? ?? false,
      rejectReason: json['reject_reason'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$PartnerRegistrationImplToJson(
        _$PartnerRegistrationImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user': instance.user,
      'date_of_birth': instance.dateOfBirth.toIso8601String(),
      'profile_image': instance.profileImage,
      'type': _$PartnerTypeEnumMap[instance.type]!,
      'business_registration_certificate_images':
          instance.businessRegistrationCertificateImages,
      'tax_id': instance.taxId,
      'authorized_representative_name': instance.authorizedRepresentativeName,
      'approved': instance.approved,
      'reject_reason': instance.rejectReason,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$PartnerTypeEnumMap = {
  PartnerType.Individual: 'Individual',
  PartnerType.Enterprise: 'Enterprise',
};
