import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../application/firebase/firebase_config.dart';

class DashboardProvider extends ChangeNotifier {
  String? token;
  User? _user;

  Future<String?> loginAndGetToken({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseConfig.auth
          .signInWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        final idToken = await user.getIdToken();

        _user = user;
        token = idToken;
        print('Logged in as ${user.email}');
        notifyListeners();
        return idToken;
      }
      return null;
    } catch (e) {
      // Use dynamic to safely capture FirebaseException on Web
      print('Login failed: ${e.toString()}');
      return null;
    }
  }
}
