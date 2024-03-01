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
    apiKey: 'AIzaSyArbnnMhA2OiGgUKOadyhsDcMplWwVevv8',
    appId: '1:935575419283:web:ddd240fb29670720119066',
    messagingSenderId: '935575419283',
    projectId: 'bubblytalks-75646',
    authDomain: 'bubblytalks-75646.firebaseapp.com',
    storageBucket: 'bubblytalks-75646.appspot.com',
    measurementId: 'G-Y4WGJ5B0ZH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCjSt-5jUhkVa26jWwqhbfzKIIFq-s9Qrw',
    appId: '1:935575419283:android:2c3b285dcc9c3f4b119066',
    messagingSenderId: '935575419283',
    projectId: 'bubblytalks-75646',
    storageBucket: 'bubblytalks-75646.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcLh7YzEZcKTOR-_BO4aVhkIesafrSmcU',
    appId: '1:935575419283:ios:f96dd4582295c429119066',
    messagingSenderId: '935575419283',
    projectId: 'bubblytalks-75646',
    storageBucket: 'bubblytalks-75646.appspot.com',
    iosBundleId: 'com.example.bubblytalks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBcLh7YzEZcKTOR-_BO4aVhkIesafrSmcU',
    appId: '1:935575419283:ios:94e704f9cfbeaf5d119066',
    messagingSenderId: '935575419283',
    projectId: 'bubblytalks-75646',
    storageBucket: 'bubblytalks-75646.appspot.com',
    iosBundleId: 'com.example.bubblytalks.RunnerTests',
  );
}