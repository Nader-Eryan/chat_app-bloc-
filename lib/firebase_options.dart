// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAbRNFmRb6X0_qE2aWwgAz2et3NVt3Y5E0',
    appId: '1:817905555935:web:937f3f1c6ee992c1194c6a',
    messagingSenderId: '817905555935',
    projectId: 'chat-app-96a5b',
    authDomain: 'chat-app-96a5b.firebaseapp.com',
    storageBucket: 'chat-app-96a5b.appspot.com',
    measurementId: 'G-MKM6PRHLEX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAerNJ1EH-YZ1pAoLSciimJlvHRSRwi4Dk',
    appId: '1:817905555935:android:e0d1e6e6a7096cbb194c6a',
    messagingSenderId: '817905555935',
    projectId: 'chat-app-96a5b',
    storageBucket: 'chat-app-96a5b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAMVtB4Ggk8wq-NOeQcf4XoyY_LTPkm38',
    appId: '1:817905555935:ios:02d6aaa78b9d6b8f194c6a',
    messagingSenderId: '817905555935',
    projectId: 'chat-app-96a5b',
    storageBucket: 'chat-app-96a5b.appspot.com',
    iosClientId: '817905555935-qtcl1b93prkno71s82i3pqvvehfsc0t2.apps.googleusercontent.com',
    iosBundleId: 'com.example.scholarChat',
  );
}
