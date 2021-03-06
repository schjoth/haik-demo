// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBdzSqp9V7Vn0FWutwfE8r-8Uph_9KBtoo',
    appId: '1:902266079428:web:3a5c501996582c1fc56191',
    messagingSenderId: '902266079428',
    projectId: 'haik-e557d',
    authDomain: 'haik-e557d.firebaseapp.com',
    storageBucket: 'haik-e557d.appspot.com',
    measurementId: 'G-K7GCH6CX2E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATmlCpT3WZ79Douq3V8ZzP2PdAurHVE0I',
    appId: '1:902266079428:android:7d5687346dd3662fc56191',
    messagingSenderId: '902266079428',
    projectId: 'haik-e557d',
    storageBucket: 'haik-e557d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAo3-AO3zghHBuA3YEHd8pWyZ9txjvQ9rI',
    appId: '1:902266079428:ios:cd53fa4d57f300bbc56191',
    messagingSenderId: '902266079428',
    projectId: 'haik-e557d',
    storageBucket: 'haik-e557d.appspot.com',
    iosClientId:
        '902266079428-otq65tm50d19s0duagd18edb6h514qlb.apps.googleusercontent.com',
    iosBundleId: 'com.example.haikapp',
  );
}
