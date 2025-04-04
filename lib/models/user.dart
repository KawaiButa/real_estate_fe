import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_estate_fe/models/address.dart';
import 'package:real_estate_fe/models/partner_registration.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/role.dart';
import 'package:real_estate_fe/models/image.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    List<Role>? roles,
    Image? profileImage,
    Address? address,
    String? phone,
    @Default([]) List<Property> properties,
    @Default([]) List<Property> favorites,
    PartnerRegistration? registration,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
