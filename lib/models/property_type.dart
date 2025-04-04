import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_type.freezed.dart';
part 'property_type.g.dart';

@freezed
class PropertyType with _$PropertyType {
  const factory PropertyType({
    required String id,
    required String name,
  }) = _PropertyType;

  factory PropertyType.fromJson(Map<String, dynamic> json) =>
      _$PropertyTypeFromJson(json);
}
