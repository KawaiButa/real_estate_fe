import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:real_estate_fe/models/image.dart';
import 'package:real_estate_fe/models/property.dart';

part 'tourview.freezed.dart';
part 'tourview.g.dart';

@freezed
class Tourview with _$Tourview {
  const factory Tourview({
    required String id,
    required String propertyId,
    required String imageId,
    required String name,
    @Default(null) Image? image,
    @Default(null) Property? property,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Tourview;

  factory Tourview.fromJson(Map<String, dynamic> json) =>
      _$TourviewFromJson(json);
}
