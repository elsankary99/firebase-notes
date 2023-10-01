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
        return macos;
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
    apiKey: 'AIzaSyDmLGyua80e2XPpplnpgIKOceS5DLhKk6c',
    appId: '1:812359554590:web:cf2f9d273aed7440b8400f',
    messagingSenderId: '812359554590',
    projectId: 'note-e9486',
    authDomain: 'note-e9486.firebaseapp.com',
    storageBucket: 'note-e9486.appspot.com',
    measurementId: 'G-NDZ2R86BGB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAexiWdK4E7y-Vru7nVBQB421RPVvFvjKY',
    appId: '1:812359554590:android:9fc0be17de835d01b8400f',
    messagingSenderId: '812359554590',
    projectId: 'note-e9486',
    storageBucket: 'note-e9486.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA3TCjmcd03y0h6dQmqbLS4R7yPRMhxOEY',
    appId: '1:812359554590:ios:a78ab85223fa7d4eb8400f',
    messagingSenderId: '812359554590',
    projectId: 'note-e9486',
    storageBucket: 'note-e9486.appspot.com',
    iosBundleId: 'com.example.fbNote',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA3TCjmcd03y0h6dQmqbLS4R7yPRMhxOEY',
    appId: '1:812359554590:ios:8807638d5d09adfab8400f',
    messagingSenderId: '812359554590',
    projectId: 'note-e9486',
    storageBucket: 'note-e9486.appspot.com',
    iosBundleId: 'com.example.fbNote.RunnerTests',
  );
}