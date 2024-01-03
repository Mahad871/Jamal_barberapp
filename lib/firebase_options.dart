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
    apiKey: 'AIzaSyDCX7QvCxSrLxCPo7yBre8t-FcyRTjJvRs',
    appId: '1:802643790860:web:ab0f9c5e7c0c80229b3229',
    messagingSenderId: '802643790860',
    projectId: 'jamal-a0429',
    authDomain: 'jamal-a0429.firebaseapp.com',
    storageBucket: 'jamal-a0429.appspot.com',
    measurementId: 'G-KC7BRN4D6K',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbGpJIap5RurRSdLF5AVFlNJhIJxdZE9g',
    appId: '1:802643790860:android:008f3f247e3874fa9b3229',
    messagingSenderId: '802643790860',
    projectId: 'jamal-a0429',
    storageBucket: 'jamal-a0429.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCI4DyxDbLfeS--Ej8UeEueXR4MV4ZpzSQ',
    appId: '1:802643790860:ios:d558edd8ed7cacfa9b3229',
    messagingSenderId: '802643790860',
    projectId: 'jamal-a0429',
    storageBucket: 'jamal-a0429.appspot.com',
    androidClientId: '802643790860-6e26m4o5veplq45sk4h6dngi4o8pinog.apps.googleusercontent.com',
    iosClientId: '802643790860-r3jeod3hf3fk2nfii1o1av7es2ib5mud.apps.googleusercontent.com',
    iosBundleId: 'com.mahadsapplication.app',
  );
}