import 'package:dartx/dartx.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/chat_session_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _chatSessionService = locator<ChatSessionService>();
  final _authService = locator<AuthService>();
  runStartupLogic() {
    _authService.getUserFromLocalStorage();
    _navigationService.navigateToWelcomeView();
    _setupFCMListeners();
  }

  _setupFCMListeners() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      switch (message.data["type"]) {
        case "chat":
          await _chatSessionService.getChatSessionList();
          final chatSession = _chatSessionService.data?.data
              .firstOrNullWhere((e) => e.id == message.data["chat_session_id"]);
          if (chatSession != null) {
            _navigationService.navigateToChatDetailView();
          }
          break;
        default:
          break;
      }
    });
    FirebaseMessaging.onMessage.listen((msg) {
      if (msg.data['type'] == 'chat') {
        _chatSessionService.upsertSessionFromData(msg.data);
      }
    });
  }
}
