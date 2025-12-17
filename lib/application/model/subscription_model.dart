// models/package_model.dart

class SubscriptionPackageList {
  final bool success;
  final List<SubscriptionPackageModel> data;

  SubscriptionPackageList({required this.success, required this.data});

  factory SubscriptionPackageList.fromJson(Map<String, dynamic> json) =>
      SubscriptionPackageList(
        success: json["success"],
        data: List<SubscriptionPackageModel>.from(
          json["data"].map((x) => SubscriptionPackageModel.fromJson(x)),
        ),
      );
}

class SubscriptionPackageModel {
  final String id;
  final String packageName;
  final double pricePerMonth;
  final int questions;
  final int activeUsers;
  final String packageType; // or use enum if you have SubscriptionType in Dart
  final List<String> categoryIds;
  final List<String> features;

  final String createdAt;
  final String updatedAt;

  SubscriptionPackageModel({
    required this.id,
    required this.packageName,
    required this.activeUsers,
    required this.pricePerMonth,
    required this.questions,
    required this.packageType,
    required this.categoryIds,
    required this.features,

    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor to create from JSON
  factory SubscriptionPackageModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionPackageModel(
      id: json['id'] as String,
      packageName: json['packageName'] as String,
      pricePerMonth: (json['pricePerMonth'] as num).toDouble(),
      questions: json['questions'] as int,
      packageType: json['packageType'] as String,
      categoryIds: List<String>.from(json['categoryIds'] ?? []),
      features: List<String>.from(json['features'] ?? []),

      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      activeUsers: json['activeUsers'] ?? 0,
    );
  }

  // Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'packageName': packageName,
      'pricePerMonth': pricePerMonth,
      'questions': questions,
      'packageType': packageType,
      'categoryIds': categoryIds,
      'features': features,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
