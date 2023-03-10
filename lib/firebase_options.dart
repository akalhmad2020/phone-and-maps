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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBBFEiQNSypuVTr1HybsSNeTQ14QLlAAWQ',
    appId: '1:403742487825:web:081a3f6bac0e6695a8c8b0',
    messagingSenderId: '403742487825',
    projectId: 'maps-app-345b7',
    authDomain: 'maps-app-345b7.firebaseapp.com',
    storageBucket: 'maps-app-345b7.appspot.com',
    measurementId: 'G-Z327WYV9KF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWOT6VfO2bg7Fzq_lDHTlwVK1Ggi6F5d4',
    appId: '1:403742487825:android:c942983b69d49f18a8c8b0',
    messagingSenderId: '403742487825',
    projectId: 'maps-app-345b7',
    storageBucket: 'maps-app-345b7.appspot.com',
  );
}
