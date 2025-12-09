import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseConfig {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future<void> initialize() async {
    // Initialize Firebase
    await Firebase.initializeApp(
      options: kIsWeb
          ? const FirebaseOptions(
              apiKey: "YOUR_API_KEY",
              authDomain: "YOUR_PROJECT_ID.firebaseapp.com",
              projectId: "YOUR_PROJECT_ID",
              storageBucket: "YOUR_PROJECT_ID.appspot.com",
              messagingSenderId: "YOUR_SENDER_ID",
              appId: "YOUR_APP_ID",
            )
          : null,
    );

    if (kDebugMode) {
      firestore.useFirestoreEmulator('localhost', 8080);
      auth.useAuthEmulator('localhost', 9099);
      storage.useStorageEmulator('localhost', 9199);
      print('Connected to Firebase Emulators (Debug Mode)');
    } else {
      print('Connected to real Firebase project (Production)');
    }
  }
}
