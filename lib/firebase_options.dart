// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform; //

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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf6ZWXVNpdBPZ75105VYH7PRhoGSzP1EQ',
    appId: '1:534118986766:android:78d40ef7120b6ca3a2385f',
    messagingSenderId: '534118986766',
    projectId: 'tobetoapp',
    databaseURL:
        'https://tobetoapp-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tobetoapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAV2ggzhmLsF1pQUQn-lOt2hsjLW_73Qk0',
    appId: '1:534118986766:ios:087f01b1b0efb00aa2385f',
    messagingSenderId: '534118986766',
    projectId: 'tobetoapp',
    databaseURL:
        'https://tobetoapp-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'tobetoapp.appspot.com',
    iosBundleId: 'com.example.tobetoApp',
  );
}
