import '../model/subscription_model.dart';

final List<SubscriptionPlan> subscriptionPlans = [
  SubscriptionPlan(
    id: "free",
    title: "Free",
    pricePerMonth: 0,
    features: [
      "1 question per day",
      "Limited access",
      "Ads included",
    ],
    activeUsers: 812,
    // percentageOfTotal: 56.5,
    questionLimitPerDay: 1,
    adsIncluded: true,
    isPopular: false,
  ),
  SubscriptionPlan(
    id: "standard",
    title: "Standard",
    pricePerMonth: 9.99,
    features: [
      "Unlimited questions",
      "Priority access",
      "No ads",
    ],
    activeUsers: 423,
    // percentageOfTotal: 29.4,
    questionLimitPerDay: -1, // unlimited
    adsIncluded: false,
    isPopular: true,
  ),
  SubscriptionPlan(
    id: "vip",
    title: "VIP",
    pricePerMonth: 19.99,
    features: [
      "Unlimited questions per day",
      "24/7 priority support",
      "Advanced analytics",
      "Zero ads",
      "VIP badge",
    ],
    activeUsers: 198,
    // percentageOfTotal: 14.1,
    questionLimitPerDay: -1, // unlimited
    adsIncluded: false,
    isPopular: false,
  ),
];
