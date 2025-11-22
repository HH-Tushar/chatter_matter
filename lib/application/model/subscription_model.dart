class SubscriptionPlan {
  final String id; // "free", "basic", "pro"
  final String title;
  final double pricePerMonth;
  // final String description; // Optional (ex: "1 Question")
  final List<String> features; // ex: ["1 question per day", "Limited access"]
  final int activeUsers;
  // final double percentageOfTotal;
  final int questionLimitPerDay; // ex: 1
  final bool adsIncluded;
  final bool isPopular; // to show badge or highlight UI

  SubscriptionPlan({
    required this.id,
    required this.title,
    required this.pricePerMonth,
    // required this.description,
    required this.features,
    required this.activeUsers,
    // required this.percentageOfTotal,
    required this.questionLimitPerDay,
    required this.adsIncluded,
    this.isPopular = false,
  });

  factory SubscriptionPlan.fromMap(Map<String, dynamic> map, String docId) {
    return SubscriptionPlan(
      id: docId,
      title: map['title'] ?? "",
      pricePerMonth: (map['pricePerMonth'] ?? 0).toDouble(),
      // description: map['description'] ?? "",
      features: List<String>.from(map['features'] ?? []),
      activeUsers: map['activeUsers'] ?? 0,
      // percentageOfTotal: (map['percentageOfTotal'] ?? 0).toDouble(),
      questionLimitPerDay: map['questionLimitPerDay'] ?? 0,
      adsIncluded: map['adsIncluded'] ?? false,
      isPopular: map['isPopular'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "pricePerMonth": pricePerMonth,
      // "description": description,
      "features": features,
      "activeUsers": activeUsers,
      // "percentageOfTotal": percentageOfTotal,
      "questionLimitPerDay": questionLimitPerDay,
      "adsIncluded": adsIncluded,
      "isPopular": isPopular,
    };
  }
}
