import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:real_estate_fe/models/chat_message.dart';
import 'package:real_estate_fe/models/chat_session.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:stacked/stacked.dart';

class FirebaseMessageService with ListenableServiceMixin {
  final _firestore = FirebaseFirestore.instance;
  final ReactiveValue<ChatMessage?> _latestMessage =
      ReactiveValue<ChatMessage?>(null);
  StreamSubscription<DocumentSnapshot>? _messageSubscription;
  ChatMessage? get latestMessage => _latestMessage.value;
  FirebaseMessageService() {
    listenToReactiveValues([_latestMessage]);
  }

  void startListeningToLastMessage({
    required String currentUserId,
    required String otherUserId,
  }) {
    final chatDocId = _generateChatDocId(currentUserId, otherUserId);

    _messageSubscription = _firestore
        .collection('chats')
        .doc(chatDocId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        final data = snapshot.data();
        _latestMessage.value = data!["last_message"];
      }
    });
  }

  void stopListeningToMessages() {
    _messageSubscription?.cancel();
    _messageSubscription = null;
  }

  String _generateChatDocId(String userId1, String userId2) {
    final sorted = [userId1, userId2]..sort();
    return '${sorted[0]}_${sorted[1]}';
  }
}
