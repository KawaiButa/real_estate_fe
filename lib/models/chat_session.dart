import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:real_estate_fe/models/chat_message.dart';
import 'package:real_estate_fe/models/user.dart';
part 'chat_session.freezed.dart';
part 'chat_session.g.dart';

@freezed
@HiveType(typeId: 1)
class ChatSession with _$ChatSession {
  const factory ChatSession({
    @HiveField(0) required String id,
    @HiveField(1) @JsonKey(name: "user_1_id") String? user1Id,
    @HiveField(2) @JsonKey(name: "user_2_id") required String user2Id,
    @HiveField(3) @JsonKey(name: "user_1") User? user1,
    @HiveField(4) @JsonKey(name: "user_2") User? user2,
    @HiveField(5) ChatMessage? lastMessage,
    @HiveField(6) @Default([]) List<ChatMessage> messages,
  }) = _ChatSession;

  factory ChatSession.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionFromJson(json);
}
