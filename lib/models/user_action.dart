import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_action.freezed.dart';
part 'user_action.g.dart';

@freezed
class PropertyVerification with _$PropertyVerification {
  const factory PropertyVerification({
    required String id,
    required String propertyId,
    String? userId,
    required String type,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PropertyVerification;

  factory PropertyVerification.fromJson(Map<String, dynamic> json) =>
      _$PropertyVerificationFromJson(json);
}
