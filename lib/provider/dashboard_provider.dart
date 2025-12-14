import 'package:chatter_matter_admin/application/model/dashboard_stats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../application/firebase/firebase_config.dart';
import '../application/repo/dashboard_repo.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardProvider() {
    // retrieveUser();
  }

  final _dashboardRepo = DashboardRepo();

  DashboardStatus? dashboardStatus;

  Future<bool> retrieveUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (dashboardStatus == null) {
      await getDashboardStats();
    }
    return user == null ? false : true;
  }

  Future<String?> loginAndGetToken({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseConfig.auth
          .signInWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        print('Logged in as ${user.email}');
        notifyListeners();
        await getDashboardStats();
        return "User login successfully";
      }
      return null;
    } catch (e) {
      // Use dynamic to safely capture FirebaseException on Web
      print('Login failed: ${e.toString()}');
      return null;
    }
  }

  Future<void> getDashboardStats() async {
    final (data, error) = await _dashboardRepo.getDashboardStats();
    dashboardStatus = data;
    notifyListeners();
  }
}
