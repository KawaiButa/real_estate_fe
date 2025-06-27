import 'dart:async';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:real_estate_fe/app/app.bottomsheets.dart';
import 'package:real_estate_fe/app/app.dialogs.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_themes.dart';
import 'package:real_estate_fe/firebase_options.dart';
import 'package:real_estate_fe/models/chat_message.dart';
import 'package:real_estate_fe/models/chat_session.dart';
import 'package:real_estate_fe/models/image.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(ChatSessionAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ChatMessageAdapter());
  Hive.registerAdapter(ImageAdapter());
  final box = await Hive.openBox<ChatSession>('sessions');
  if (message.data['type'] == 'chat') {
    final id = message.data['chat_session_id']!;
    final existing = box.get(id);
    if (existing == null) return;
    existing.messages.add(ChatMessage(
        id: id,
        sessionId: id,
        senderId: message.data["sender_id"],
        content: message.data["content"],
        createdAt: (message.data["created_at"] as Timestamp).toDate()));
    box.put(id, existing);
  }
  print("Handling a background message: ${message.messageId}");
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['vi', 'en'],
    assetsDirectory: 'assets/lang/',
  );

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ChatSessionAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ChatMessageAdapter());
  Hive.registerAdapter(ImageAdapter());
  await Hive.openBox<ChatSession>("chat_sessions");
  HttpOverrides.global = MyHttpOverrides();
  final result = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (result.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  await dotenv.load(fileName: 'assets/.env');
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(
    LocalizedApp(
      child: AdaptiveTheme(
        light: ThemeData(
            buttonTheme: ButtonThemeData(buttonColor: AppColors.primaryColor)),
        initial: AdaptiveThemeMode.light,
        builder: (light, dark) => const MainApp(),
      ),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: AppTheme().lightTheme(),
        dark: AppTheme().darkTheme(),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) => MaterialApp(
              initialRoute: Routes.startupView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              navigatorKey: StackedService.navigatorKey,
              navigatorObservers: [
                StackedService.routeObserver,
                // SentryNavigatorObserver()
              ],
              localizationsDelegates: [
                ...translator.delegates, // Android + iOS Delegates
                FlutterQuillLocalizations.delegate,
              ],
              locale: translator.activeLocale, // Active locale
              supportedLocales: translator.locals(), // Locals list
            ));
  }
}
