import 'package:chatview/chatview.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:real_estate_fe/models/address.dart';
import 'package:real_estate_fe/models/partner_registration.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/role.dart';
import 'package:real_estate_fe/models/image.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: 2)
class User with _$User {
  const factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    List<Role>? roles,
    Image? profileImage,
    Address? address,
    @HiveField(3) String? phone,
    @Default([]) List<Property> properties,
    @Default([]) List<Property> favorites,
    PartnerRegistration? partnerRegistration,
    @HiveField(4) required DateTime createdAt,
    @HiveField(5) DateTime? updatedAt,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

extension UserToChatUser on User {
  ChatUser toChatUser() {
    return ChatUser(id: id, name: name, profilePhoto: profileImage?.url);
  }
}
