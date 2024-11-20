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
    apiKey: 'AIzaSyCvfs-f_-8fc8C7E_T7yM2vKcxGHFpk9PA',
    appId: '1:228633136307:web:e12de117883b48dd1db4c6',
    messagingSenderId: '228633136307',
    projectId: 'onesignal-test-app-56a9b',
    authDomain: 'onesignal-test-app-56a9b.firebaseapp.com',
    storageBucket: 'onesignal-test-app-56a9b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeloskGeOQMdB_YFXXwXhgz66STpnrxiM',
    appId: '1:228633136307:android:11ca4c9bd9d17c021db4c6',
    messagingSenderId: '228633136307',
    projectId: 'onesignal-test-app-56a9b',
    storageBucket: 'onesignal-test-app-56a9b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAJF_l4Aj6lGSeE-uw_IYX9TMyAo7WPn3U',
    appId: '1:228633136307:ios:ad577b0fe3156f021db4c6',
    messagingSenderId: '228633136307',
    projectId: 'onesignal-test-app-56a9b',
    storageBucket: 'onesignal-test-app-56a9b.firebasestorage.app',
    iosBundleId: 'com.app.abakon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAJF_l4Aj6lGSeE-uw_IYX9TMyAo7WPn3U',
    appId: '1:228633136307:ios:ad577b0fe3156f021db4c6',
    messagingSenderId: '228633136307',
    projectId: 'onesignal-test-app-56a9b',
    storageBucket: 'onesignal-test-app-56a9b.firebasestorage.app',
    iosBundleId: 'com.app.abakon',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCvfs-f_-8fc8C7E_T7yM2vKcxGHFpk9PA',
    appId: '1:228633136307:web:9d10f06d1bb88dcf1db4c6',
    messagingSenderId: '228633136307',
    projectId: 'onesignal-test-app-56a9b',
    authDomain: 'onesignal-test-app-56a9b.firebaseapp.com',
    storageBucket: 'onesignal-test-app-56a9b.firebasestorage.app',
  );
}