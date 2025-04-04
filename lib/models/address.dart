import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    required String id,
    required String street,
    required String city,
    String? postalCode,
    String? neighborhood,
    required double latitude,
    required double longitude,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
