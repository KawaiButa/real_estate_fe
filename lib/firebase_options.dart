// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAIM-RY-NJlbEixvFEgIoj7nHOqorEu_rg',
    appId: '1:679560385469:android:14eb644a2e4ddf763b38d4',
    messagingSenderId: '679560385469',
    projectId: 'real-estate-5bcc3',
    storageBucket: 'real-estate-5bcc3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC0VL-zLpvPLr6oRyCH69qKmmM_CFuwK1o',
    appId: '1:679560385469:ios:225fc7e62b74ca0b3b38d4',
    messagingSenderId: '679560385469',
    projectId: 'real-estate-5bcc3',
    storageBucket: 'real-estate-5bcc3.firebasestorage.app',
    iosBundleId: 'com.example.realEstateFe',
  );
  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyABrod4jtvZZ798p2VAZsk0_Qk_VG2Lbok",
      authDomain: "real-estate-5bcc3.firebaseapp.com",
      projectId: "real-estate-5bcc3",
      storageBucket: "real-estate-5bcc3.firebasestorage.app",
      messagingSenderId: "679560385469",
      appId: "1:679560385469:web:5ee41a37f29134023b38d4");
}
