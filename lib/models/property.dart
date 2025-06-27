import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_estate_fe/models/address.dart';
import 'package:real_estate_fe/models/image.dart';
import 'package:real_estate_fe/models/property_type.dart';
import 'package:real_estate_fe/models/review.dart';
import 'package:real_estate_fe/models/user.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  const factory Property({
    required String id,
    required String title,
    required String propertyCategory,
    required String transactionType,
    required double price,
    required int bedrooms,
    required int bathrooms,
    required String propertyTypeId,
    required PropertyType propertyType,
    required String description,
    required bool status,
    required Address address,
    required User? owner,
    required DateTime createdAt,
    required String ownerId,
    double? averageRating,
    double? sqm,
    @Default([]) List<Review> reviews,
    @Default([]) List<Image> images,
    DateTime? updatedAt,
    @JsonKey(includeFromJson: false) int? totalReviewCount,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}
