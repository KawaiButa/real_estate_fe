// lib/ui/views/chat_list/chat_list_viewmodel.dart
import 'package:hive/hive.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/models/chat_session.dart';
import 'package:real_estate_fe/models/paginated_list.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/chat_session_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatListViewModel extends StreamViewModel<BoxEvent> {
  final _chatSessionService = locator<ChatSessionService>();
  final refreshController = RefreshController();
  final _navigationService = locator<NavigationService>();

  @override
  Stream<BoxEvent> get stream => _chatSessionService.sessionsBox.watch();

  PaginatedList<ChatSession>? get paginatedChatSession =>
      _chatSessionService.data;
  User? getOtherUser(ChatSession session) {
    if (session.user1Id == AuthService.currentUser?.id) {
      return session.user2!;
    }
    return session.user1;
  }

  Future<void> refreshData() async {
    await getChatSession();
    refreshController.refreshCompleted();
  }

  void navigateToChatDetail(ChatSession session) {
    _navigationService.navigateToChatDetailView(chatSession: session);
  }

  Future<List<ChatSession>> getChatSession() async {
    try {
      setBusy(true);
      final paginatedSession = await _chatSessionService.getChatSessionList();
      return paginatedSession?.data ?? [];
    } finally {
      setBusy(false);
    }
  }
}
