import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_estate_fe/models/image.dart';
import 'package:real_estate_fe/models/user.dart';
// Import your nested models as needed, e.g.:
// import 'user.dart';
// import 'image.dart';

part 'partner_registration.freezed.dart';
part 'partner_registration.g.dart';

enum PartnerType {
  Individual,
  Enterprise,
}

@freezed
class PartnerRegistration with _$PartnerRegistration {
  const factory PartnerRegistration({
    String? userId,
    User? user,
    required DateTime dateOfBirth,
    Image? profileImage,
    required PartnerType type,
    @Default([]) List<Image> businessRegistrationCertificateImages,
    String? taxId,
    String? authorizedRepresentativeName,
    @Default(false) bool approved,
    String? rejectReason,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _PartnerRegistration;

  factory PartnerRegistration.fromJson(Map<String, dynamic> json) =>
      _$PartnerRegistrationFromJson(json);
}
