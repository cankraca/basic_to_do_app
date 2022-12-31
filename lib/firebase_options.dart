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
    apiKey: 'AIzaSyC5SChWC-rddlJdB-YY3DJsVT5embTuDSE',
    appId: '1:242994729249:web:413d280956a22762836e60',
    messagingSenderId: '242994729249',
    projectId: 'basic-to-do-database',
    authDomain: 'basic-to-do-database.firebaseapp.com',
    storageBucket: 'basic-to-do-database.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCr1bi9W6fAbRlMM-67-vdi-SQtyypL_Io',
    appId: '1:242994729249:android:2578a50be3dfcf42836e60',
    messagingSenderId: '242994729249',
    projectId: 'basic-to-do-database',
    storageBucket: 'basic-to-do-database.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDSjZ9IprnpuWo0QSjSEapWJTqJEAum2E0',
    appId: '1:242994729249:ios:e20a3268ee04b483836e60',
    messagingSenderId: '242994729249',
    projectId: 'basic-to-do-database',
    storageBucket: 'basic-to-do-database.appspot.com',
    iosClientId:
        '242994729249-u2t6sutvhl6bncfm3koqht8d9npikkcq.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicTodoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDSjZ9IprnpuWo0QSjSEapWJTqJEAum2E0',
    appId: '1:242994729249:ios:e20a3268ee04b483836e60',
    messagingSenderId: '242994729249',
    projectId: 'basic-to-do-database',
    storageBucket: 'basic-to-do-database.appspot.com',
    iosClientId:
        '242994729249-u2t6sutvhl6bncfm3koqht8d9npikkcq.apps.googleusercontent.com',
    iosBundleId: 'com.example.basicTodoApp',
  );
}