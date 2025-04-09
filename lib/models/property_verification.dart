import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/user.dart';

part 'property_verification.freezed.dart';
part 'property_verification.g.dart';

@freezed
class PropertyVerification with _$PropertyVerification {
  const factory PropertyVerification({
    required String id,
    required String propertyId,
    required String userId,
    required String verificationMethod,
    required String verificationCode,
    required Property property,
    required User user,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PropertyVerification;

  factory PropertyVerification.fromJson(Map<String, dynamic> json) =>
      _$PropertyVerificationFromJson(json);
}
