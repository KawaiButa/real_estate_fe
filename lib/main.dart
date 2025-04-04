import 'dart:async';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:real_estate_fe/app/app.bottomsheets.dart';
import 'package:real_estate_fe/app/app.dialogs.dart';
import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/app/app.router.dart';
import 'package:real_estate_fe/constants/app_themes.dart';
import 'package:real_estate_fe/constants/env_string.dart';
import 'package:real_estate_fe/firebase_options.dart';
import 'package:real_estate_fe/services/local_storage_service.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

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
  // Initialize localization
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['vi', 'en'],
    assetsDirectory: 'assets/lang/',
  );

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  HttpOverrides.global = MyHttpOverrides();

  final packageInfo = await PackageInfo.fromPlatform();
  await dotenv.load(fileName: 'assets/.env');
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  // Initialize services
  await LocalStorageService.getPrefs();

  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = EnvString.sentryDsn;
  //     options.release = '${packageInfo.version}+${packageInfo.buildNumber}';
  //     options.sendDefaultPii = true;
  //   },
  //   appRunner: () => runApp(
  //     SentryWidget(
  //       child: LocalizedApp(
  //         child: const MainApp(),
  //       ),
  //     ),
  //   ),
  // );
  runApp(
    LocalizedApp(
      child: const MainApp(),
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
              localizationsDelegates:
                  translator.delegates, // Android + iOS Delegates
              locale: translator.activeLocale, // Active locale
              supportedLocales: translator.locals(), // Locals list
            ));
  }
}
