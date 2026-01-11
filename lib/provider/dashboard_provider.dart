import 'package:chatter_matter_admin/application/model/dashboard_stats.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import '../application/firebase/firebase_config.dart';
import '../application/model/transaction_model.dart';
import '../application/repo/dashboard_repo.dart';

class DashboardProvider extends ChangeNotifier {
  DashboardProvider() {
    // retrieveUser();
    // init();
  }

  final _dashboardRepo = DashboardRepo();
  bool isLoadingTransaction = false;
  bool isPaginatingTransaction = false;
  bool reachEnd = false;
  User? user;

  DashboardStatus? dashboardStatus;
  SubscriptionTransactionResponse? _subscriptionTransactionResponse;
  List<SubscriptionTransaction> transactionList = [];

  init() async {
    await getTransactions();
    await getDashboardStats();
  }

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

       user = userCredential.user;

      if (user != null) {
        print('Logged in as ${user?.email}');
        notifyListeners();
        await init();
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

  Future<void> getTransactions() async {
    if (_subscriptionTransactionResponse != null &&
        _subscriptionTransactionResponse?.nextPageToken == null) {
      reachEnd = true;
      return;
    }
    if (_subscriptionTransactionResponse == null) {
      isLoadingTransaction = true;
    } else {
      isPaginatingTransaction = true;
    }
    notifyListeners();

    final (data, error) = await _dashboardRepo.getTransactionStats();
    if (data != null && _subscriptionTransactionResponse != null) {
      _subscriptionTransactionResponse = data;
      transactionList.addAll(data.data);
    } else if (data != null) {
      _subscriptionTransactionResponse = data;
      transactionList = data.data;
    }

    isLoadingTransaction = false;
    isPaginatingTransaction = false;
    notifyListeners();
  }

  Future<void> restoreTransaction() async {
    _subscriptionTransactionResponse = null;
    await getTransactions();
  }
}
