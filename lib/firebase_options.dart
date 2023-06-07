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
    apiKey: 'AIzaSyBJS9KL5O_jwkFsKDrx1-BSl_bgYPqKmnM',
    appId: '1:640414700102:web:ea1e95577e65f7941d3047',
    messagingSenderId: '640414700102',
    projectId: 'library-management-9d3ec',
    authDomain: 'library-management-9d3ec.firebaseapp.com',
    databaseURL: 'https://library-management-9d3ec-default-rtdb.firebaseio.com',
    storageBucket: 'library-management-9d3ec.appspot.com',
    measurementId: 'G-R3GXJYZGYV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBN8kFvIiCpnb-5TqnILqBQ7smdswjWjb8',
    appId: '1:640414700102:android:72852b4b72a3c10d1d3047',
    messagingSenderId: '640414700102',
    projectId: 'library-management-9d3ec',
    databaseURL: 'https://library-management-9d3ec-default-rtdb.firebaseio.com',
    storageBucket: 'library-management-9d3ec.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcvOEbr2viGTXEpg-QkGf1efocAI-Fphc',
    appId: '1:640414700102:ios:f023dcc5c5d57ba91d3047',
    messagingSenderId: '640414700102',
    projectId: 'library-management-9d3ec',
    databaseURL: 'https://library-management-9d3ec-default-rtdb.firebaseio.com',
    storageBucket: 'library-management-9d3ec.appspot.com',
    iosClientId: '640414700102-hn509qrlegms9c6ucbmq6pu57bpfd594.apps.googleusercontent.com',
    iosBundleId: 'com.example.libraryManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcvOEbr2viGTXEpg-QkGf1efocAI-Fphc',
    appId: '1:640414700102:ios:28898261601c495c1d3047',
    messagingSenderId: '640414700102',
    projectId: 'library-management-9d3ec',
    databaseURL: 'https://library-management-9d3ec-default-rtdb.firebaseio.com',
    storageBucket: 'library-management-9d3ec.appspot.com',
    iosClientId: '640414700102-4ua591d8tk8aenfet263mer63vs6rrj0.apps.googleusercontent.com',
    iosBundleId: 'com.example.libraryManagement.RunnerTests',
  );
}
