import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_action.freezed.dart';
part 'user_action.g.dart';

@freezed
class UserAction with _$UserAction {
  const factory UserAction({
    required String id,
    required String propertyId,
    String? userId,
    required String type,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserAction;

  factory UserAction.fromJson(Map<String, dynamic> json) =>
      _$UserActionFromJson(json);
}
