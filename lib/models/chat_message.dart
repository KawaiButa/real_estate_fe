import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:real_estate_fe/models/image.dart';
import 'package:real_estate_fe/models/user.dart';
part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
@HiveType(typeId: 3)
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    @HiveField(0) required String id,
    @HiveField(2) required String sessionId,
    @HiveField(4) required DateTime createdAt,
    @HiveField(1) String? senderId,
    @HiveField(3) @Default("") String content,
    @HiveField(5) @Default([]) List<Image> images,
    @HiveField(6) User? sender,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}
