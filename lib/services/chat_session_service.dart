import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:hive/hive.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/chat_message.dart';
import 'package:real_estate_fe/models/chat_session.dart';
import 'package:real_estate_fe/models/paginated_list.dart';
import 'package:real_estate_fe/models/paginated_metadata.dart';
import 'package:real_estate_fe/services/http_service.dart';

class ChatSessionService extends HttpService<PaginatedList<ChatSession>> {
  Box<ChatSession> sessionsBox = Hive.box<ChatSession>('chat_sessions');
  @override
  PaginatedList<ChatSession> fromResponse(Response response) {
    return PaginatedList(
        data: (response.data["items"] as List)
            .map((e) => ChatSession.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(response.data));
  }

  @override
  PaginatedList<ChatSession> parser(Map<String, dynamic> hiveMap) {
    return PaginatedList(
        data: (hiveMap["items"] as List)
            .map((e) => ChatSession.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(hiveMap));
  }

  Future<PaginatedList<ChatSession>?> getChatSessionList() async {
    final result = await get(Api.chatSession, forceRefresh: true);
    data = result;
    if (result != null) {
      sessionsBox
          .putAll({for (var session in result.data) session.id: session});
    }
    return result;
  }

  Future<ChatSession?> getChatSession(String id) async {
    final response = await callApi(
        Api.chatSessionById(id),
        Options(
          headers: await getHeaders(),
        ),
        {});
    if (response.statusCode != 200) return null;
    final chatSession = ChatSession.fromJson(response.data);
    sessionsBox.put(chatSession.id, chatSession);
    return chatSession;
  }

  void upsertSessionFromData(Map<String, dynamic> d) {
    final id = d['chat_session_id']!;
    final existing = sessionsBox.get(id);
    if (existing == null) {
      return;
    }
    existing.messages.add(ChatMessage(
        id: d["id"],
        sessionId: id,
        senderId: d["sender_id"],
        content: d["content"],
        createdAt: (d["created_at"] as Timestamp).toDate()));
    sessionsBox.put(id, existing);
  }

  void upsertSessionFromChatMessage(String id, ChatMessage message) {
    ChatSession? existing = sessionsBox.get(id);
    if (existing == null) {
      return;
    }
    existing = existing.copyWith(messages: [...existing.messages, message]);
    sessionsBox.put(id, existing);
  }

  void upsertSessionFromChatMessageList(String id, List<ChatMessage> messages) {
    ChatSession? existing = sessionsBox.get(id);
    if (existing == null) {
      return;
    }
    existing = existing.copyWith(
        messages: mergeMessages(
            localMessages: existing.messages, remoteMessages: messages));
    sessionsBox.put(id, existing);
  }

  List<ChatMessage> mergeMessages({
    required List<ChatMessage> localMessages,
    required List<ChatMessage> remoteMessages,
  }) {
    final localIds = localMessages.map((m) => m.id).toSet();
    final newMessages =
        remoteMessages.where((m) => !localIds.contains(m.id)).toList();
    final allMessages = [...localMessages, ...newMessages];
    allMessages.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return allMessages;
  }
}
