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
    apiKey: 'AIzaSyBN-c_yKdyU-wLkYmT0a72f3r3c0Lf3pEs',
    appId: '1:376736213358:web:c3732e619326c3be1b397f',
    messagingSenderId: '376736213358',
    projectId: 'coachpal-uanl',
    authDomain: 'coachpal-uanl.firebaseapp.com',
    storageBucket: 'coachpal-uanl.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-i4v0hGwshCexCwyLGRGn5e0-mudmgUE',
    appId: '1:376736213358:android:79b78f4105e7df161b397f',
    messagingSenderId: '376736213358',
    projectId: 'coachpal-uanl',
    storageBucket: 'coachpal-uanl.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzibtdTWeepchE24IJUfEr3JXzvN3mq6c',
    appId: '1:376736213358:ios:e0c96d6735b6f4a11b397f',
    messagingSenderId: '376736213358',
    projectId: 'coachpal-uanl',
    storageBucket: 'coachpal-uanl.appspot.com',
    iosBundleId: 'com.example.coachpaluanl',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzibtdTWeepchE24IJUfEr3JXzvN3mq6c',
    appId: '1:376736213358:ios:e0c96d6735b6f4a11b397f',
    messagingSenderId: '376736213358',
    projectId: 'coachpal-uanl',
    storageBucket: 'coachpal-uanl.appspot.com',
    iosBundleId: 'com.example.coachpaluanl',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBN-c_yKdyU-wLkYmT0a72f3r3c0Lf3pEs',
    appId: '1:376736213358:web:e1912264826064a61b397f',
    messagingSenderId: '376736213358',
    projectId: 'coachpal-uanl',
    authDomain: 'coachpal-uanl.firebaseapp.com',
    storageBucket: 'coachpal-uanl.appspot.com',
  );
}
