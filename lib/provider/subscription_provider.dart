import 'package:flutter/widgets.dart';

import '../application/model/subscription_model.dart';
import '../application/repo/subscription_repo.dart';

class SubscriptionProvider extends ChangeNotifier {
  SubscriptionProvider() {
    getPackages();
  }
  final _subscriptionRepo = SubscriptionRepo();
  bool isLoading = false;
  bool isUpdating = false;
  List<SubscriptionPackageModel> plans = [];
  // bool isLoading = false;

  void getPackages() async {
    isLoading = true;
    notifyListeners();
    final (data, error) = await _subscriptionRepo.getPackages();
    if (data != null) {
      plans = data.data;
    }
    isLoading = false;
    notifyListeners();
  }
}
