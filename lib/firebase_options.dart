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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBJPEZtgmJEc6f3z0cdK_soAQnAaL4RdU4',
    appId: '1:1041513537956:web:bc3be790a30a57ed78a131',
    messagingSenderId: '1041513537956',
    projectId: 'skillku-capstone',
    authDomain: 'skillku-capstone.firebaseapp.com',
    storageBucket: 'skillku-capstone.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2jyPurPERmigcaNDeV967Uvp_Cg6HNDo',
    appId: '1:1041513537956:android:8e43126431e2185878a131',
    messagingSenderId: '1041513537956',
    projectId: 'skillku-capstone',
    storageBucket: 'skillku-capstone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzpS9ebx_rCECjZzu2dRRsq4TPMp45ZGY',
    appId: '1:1041513537956:ios:e51d7f26eb04acfc78a131',
    messagingSenderId: '1041513537956',
    projectId: 'skillku-capstone',
    storageBucket: 'skillku-capstone.appspot.com',
    iosBundleId: 'com.example.skillku',
  );
}
