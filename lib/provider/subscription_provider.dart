import 'package:flutter/widgets.dart';

import '../application/model/subscription_model.dart';
import '../application/repo/subscription_data.dart';

class SubscriptionProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isUpdating = false;
  List<SubscriptionPlan> plans = subscriptionPlans;
  // bool isLoading = false;
}
