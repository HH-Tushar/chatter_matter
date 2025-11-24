class SubscriptionPlan {
  final String id;
  final String title;
  final String type; // "free", "basic", "pro"
  final double pricePerMonth;
  final List<String> features; 
  final int activeUsers;

  final int questionLimitPerDay; // ex: 1
  final bool adsIncluded;
  final bool isPopular; 

  SubscriptionPlan({
    required this.id,
    required this.title,
    required this.pricePerMonth,
    required this.type,
    required this.features,
    required this.activeUsers,
    required this.questionLimitPerDay,
    required this.adsIncluded,
    this.isPopular = false,
  });

  factory SubscriptionPlan.fromMap(Map<String, dynamic> map, String docId) {
    return SubscriptionPlan(
      id: docId,
      title: map['title'] ?? "",
      pricePerMonth: (map['pricePerMonth'] ?? 0).toDouble(),
      type: map['type'] ?? "",
      features: List<String>.from(map['features'] ?? []),
      activeUsers: map['activeUsers'] ?? 0,
      questionLimitPerDay: map['questionLimitPerDay'] ?? 0,
      adsIncluded: map['adsIncluded'] ?? false,
      isPopular: map['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "pricePerMonth": pricePerMonth,
      "type": type,
      "features": features,
      "activeUsers": activeUsers,
      "questionLimitPerDay": questionLimitPerDay,
      "adsIncluded": adsIncluded,
      "isPopular": isPopular,
    };
  }
}
