import 'package:chatview_utils/src/values/enumeration.dart';
import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/constants/api.dart';
import 'package:real_estate_fe/models/chat_message.dart';
import 'package:real_estate_fe/models/paginated_list.dart';
import 'package:real_estate_fe/models/paginated_metadata.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/chat_session_service.dart';
import 'package:real_estate_fe/services/http_service.dart';

class ChatService extends HttpService<PaginatedList<ChatMessage>> {
  final _chatSessionService = locator<ChatSessionService>();
  @override
  PaginatedList<ChatMessage> fromResponse(Response response) {
    return PaginatedList(
        data: (response.data["items"] as List)
            .map((e) => ChatMessage.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(response.data));
  }

  @override
  PaginatedList<ChatMessage> parser(Map<String, dynamic> hiveMap) {
    return PaginatedList(
        data: (hiveMap["items"] as List)
            .map((e) => ChatMessage.fromJson(e))
            .toList(),
        metadata: PaginatedMetadata.fromJson(hiveMap));
  }

  Future<PaginatedList<ChatMessage>?> getChatMessagesByUser(User user,
      {int page = 1}) async {
    final result = await get(Api.chatMessageByUserId(user.id),
        queryParameters: {"page": page});
    return result;
  }

  Future<PaginatedList<ChatMessage>?> getChatMessagesBySession(String id,
      {int page = 1}) async {
    final result = await get(Api.chatMessageBySessionId(id),
        queryParameters: {"page": page}, forceRefresh: true);

    _chatSessionService.upsertSessionFromChatMessageList(
        id, result?.data ?? []);
    return result;
  }

  Future<ChatMessage?> sendMessage(String message, MessageType messageType,
      {String? userId, String? sessionId, bool isAi = false}) async {
    FormData? formData;
    switch (messageType) {
      case MessageType.image:
        formData = FormData.fromMap({
          "image_list": [
            await MultipartFile.fromFile(
              message,
            )
          ],
          "content": null,
          "user_id": userId,
          "session_id": sessionId,
          "is_ai": isAi
        });
        break;
      default:
        formData = FormData.fromMap({
          "content": message,
          "image_list": null,
          "user_id": userId,
          "session_id": sessionId,
          "is_ai": isAi
        });
    }
    final result = await postWithFiles(Api.chatMessage, {}, formData: formData);
    if (result.statusCode != 201) {
      return null;
    }
    final chatMessage = ChatMessage.fromJson(result.data);
    _chatSessionService.upsertSessionFromChatMessage(
        chatMessage.sessionId, chatMessage);
    return chatMessage;
  }
}
