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
    apiKey: 'AIzaSyD9prwMWggcU1Has3Wv6ujBxB3ifqVTolA',
    appId: '1:807600046762:web:b33c432fe7735faa7ec6d3',
    messagingSenderId: '807600046762',
    projectId: 'products-app-e126a',
    authDomain: 'products-app-e126a.firebaseapp.com',
    storageBucket: 'products-app-e126a.appspot.com',
    measurementId: 'G-VR52JQQ2QJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCAiWIwb_qWE4lACSn8a6E5mAeEyasImAY',
    appId: '1:807600046762:android:7a545b1530b158247ec6d3',
    messagingSenderId: '807600046762',
    projectId: 'products-app-e126a',
    storageBucket: 'products-app-e126a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQNgI6alZbT7ERERDMET1Gk0BOkbw-zko',
    appId: '1:807600046762:ios:7554192f1f0c5b927ec6d3',
    messagingSenderId: '807600046762',
    projectId: 'products-app-e126a',
    storageBucket: 'products-app-e126a.appspot.com',
    iosClientId: '807600046762-3jg949la86d4oltd8m5u6jjvcdfk9ljf.apps.googleusercontent.com',
    iosBundleId: 'com.example.productsFirebase',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQNgI6alZbT7ERERDMET1Gk0BOkbw-zko',
    appId: '1:807600046762:ios:7554192f1f0c5b927ec6d3',
    messagingSenderId: '807600046762',
    projectId: 'products-app-e126a',
    storageBucket: 'products-app-e126a.appspot.com',
    iosClientId: '807600046762-3jg949la86d4oltd8m5u6jjvcdfk9ljf.apps.googleusercontent.com',
    iosBundleId: 'com.example.productsFirebase',
  );
}
