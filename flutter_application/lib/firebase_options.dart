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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyATAh1W58NTZAQozzvP79tvtUjgSPBUfuM',
    appId: '1:310813559662:web:9a7a3def5196a8aac8cf7f',
    messagingSenderId: '310813559662',
    projectId: 'testapp1-3f0de',
    authDomain: 'testapp1-3f0de.firebaseapp.com',
    storageBucket: 'testapp1-3f0de.appspot.com',
    measurementId: 'G-6R60FFMGYV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAkXoMu534yI2sJrz3jNXMBptW2C33fLIA',
    appId: '1:310813559662:android:818b620dd896bdabc8cf7f',
    messagingSenderId: '310813559662',
    projectId: 'testapp1-3f0de',
    storageBucket: 'testapp1-3f0de.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBu-Z3O6AGz3dzpQEyRsbNM0fRKOGK2Kk0',
    appId: '1:310813559662:ios:b80705f81b3b7606c8cf7f',
    messagingSenderId: '310813559662',
    projectId: 'testapp1-3f0de',
    storageBucket: 'testapp1-3f0de.appspot.com',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBu-Z3O6AGz3dzpQEyRsbNM0fRKOGK2Kk0',
    appId: '1:310813559662:ios:b80705f81b3b7606c8cf7f',
    messagingSenderId: '310813559662',
    projectId: 'testapp1-3f0de',
    storageBucket: 'testapp1-3f0de.appspot.com',
    iosBundleId: 'com.example.flutterApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyATAh1W58NTZAQozzvP79tvtUjgSPBUfuM',
    appId: '1:310813559662:web:ee6a6daaedfb4a7ac8cf7f',
    messagingSenderId: '310813559662',
    projectId: 'testapp1-3f0de',
    authDomain: 'testapp1-3f0de.firebaseapp.com',
    storageBucket: 'testapp1-3f0de.appspot.com',
    measurementId: 'G-TEF7B0X1JY',
  );

}