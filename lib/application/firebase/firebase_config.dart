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
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAIiafel-JFM4wEeQaHG-3bAB_fJFtddR4',
        appId: '1:196013058870:web:af1c436ce3ae457e476197',
        messagingSenderId: '196013058870',
        projectId: 'chatter-matters',
        authDomain: 'chatter-matters.firebaseapp.com',
        storageBucket: 'chatter-matters.firebasestorage.app',
      ),
    );

    // if (kDebugMode) {
    //   firestore.useFirestoreEmulator('localhost', 8080);
    //   auth.useAuthEmulator('localhost', 9099);
    //   storage.useStorageEmulator('localhost', 9199);
    //   print('Connected to Firebase Emulators (Debug Mode)');
    // } else {
    //   print('Connected to real Firebase project (Production)');
    // }
  }
}
