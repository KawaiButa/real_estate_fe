import 'package:chatview/chatview.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/chat_session.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/chat_service.dart';
import 'package:real_estate_fe/services/chat_session_service.dart';
import 'package:real_estate_fe/services/firebase_message_service.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatDetailViewModel extends StreamViewModel {
  ChatSession? chatSession;
  final User? user;
  final _firebaseMessageService = locator<FirebaseMessageService>();
  final _chatService = locator<ChatService>();
  final _chatSessionService = locator<ChatSessionService>();

  ChatController? chatController;
  bool get isLastPage => !(_chatService.data?.hasNextPage ?? false);
  @override
  List<ListenableServiceMixin> get listenableServices =>
      [_firebaseMessageService];
  ChatDetailViewModel({required this.chatSession, required this.user})
      : assert(chatSession != null || user != null,
            'Either chatSession or user must be non-null');
  User? get otherUser {
    if (chatSession != null) {
      return chatSession!.user1Id == AuthService.currentUser?.id
          ? chatSession!.user2
          : chatSession!.user1;
    }
    return user;
  }

  String get otherUserId => otherUser?.id ?? "";
  initViewModel() async {
    try {
      setBusy(true);
      chatController = ChatController(
        initialMessageList: (chatSession == null
                ? []
                : (_chatSessionService.sessionsBox
                        .get(chatSession!.id)
                        ?.messages ??
                    []))
            .map((e) => Message(
                createdAt: e.createdAt,
                sentBy: e.senderId ?? "0",
                id: e.id,
                messageType:
                    e.images.isNotEmpty ? MessageType.image : MessageType.text,
                message: e.images.isNotEmpty ? e.images[0].url : e.content))
            .toList(),
        scrollController: ScrollController(),
        currentUser: AuthService.currentUser!.toChatUser(),
        otherUsers: [
          otherUser != null
              ? otherUser!.toChatUser()
              : ChatUser(id: '0', name: "AI Assistant".tr())
        ],
      );
      if (chatSession != null) {
        _chatSessionService.sessionsBox
            .watch(key: chatSession?.id)
            .listen((event) {
          if ((chatController?.initialMessageList.length ?? 0) ==
              (event.value as ChatSession).messages.length) {
            return;
          }
          chatController?.initialMessageList.clear();
          chatController?.initialMessageList.insertAll(
              0,
              (event.value as ChatSession).messages.map((e) => Message(
                  createdAt: e.createdAt,
                  sentBy: e.senderId ?? "0",
                  id: e.id,
                  messageType: e.images.isNotEmpty
                      ? MessageType.image
                      : MessageType.text,
                  message: e.images.isNotEmpty ? e.images[0].url : e.content)));
        });
      }
      loadMoreData();
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _firebaseMessageService.stopListeningToMessages();
    super.dispose();
  }

  void onSendTap(
      String message, ReplyMessage replyMessage, MessageType messageType) {
    final currentTimeStamp = DateTime.timestamp().toString();
    final chatMessage = Message(
        id: currentTimeStamp,
        message: message,
        createdAt: DateTime.now(),
        messageType: messageType,
        status: MessageStatus.pending,
        sentBy: AuthService.currentUser!.id);
    chatController?.addMessage(chatMessage);
    try {
      _chatService
          .sendMessage(message, messageType,
              sessionId: chatSession?.id, userId: user?.id, isAi: user == null)
          .then((value) {
        chatController?.initialMessageList.replaceWhere(
            (e) => e.id == DateTime.timestamp().toString(),
            chatMessage.copyWith(
                id: value == null ? currentTimeStamp : value.id,
                status: value == null
                    ? MessageStatus.undelivered
                    : MessageStatus.delivered));
        if (chatSession == null) updateChatSession(value?.sessionId);
        notifyListeners();
      });
    } catch (error) {
      chatController?.initialMessageList.replaceWhere(
          (e) => e.id == DateTime.timestamp().toString(),
          chatMessage.copyWith(
              id: currentTimeStamp, status: MessageStatus.undelivered));
    }
  }

  updateChatSession(String? sessionId) async {
    if (sessionId == null) return;
    if (chatController!.initialMessageList.isNotEmpty &&
        chatController!.initialMessageList[0].status ==
            MessageStatus.delivered) {
      chatSession = await _chatSessionService.getChatSession(sessionId);
    }
  }

  Future<void> loadMoreData() async {
    if (chatSession != null) {
      await _chatService.getChatMessagesBySession(chatSession!.id,
          page: (_chatService.data?.page ?? 0) + 1);
    } else {
      await _chatService.getChatMessagesByUser(user!,
          page: (_chatService.data?.page ?? 0) + 1);
    }
    notifyListeners();
  }

  @override
  Stream get stream =>
      _chatSessionService.sessionsBox.watch(key: chatSession?.id);
}
