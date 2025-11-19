import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String id;
  final String title;
  // final String icon;
  final String colorCode;
  final int questionCount;
  final int favoritesCount;
  final DateTime? createdAt;
  final DateTime ? updatedAt;

  Category({
    required this.id,
    required this.title,
    // required this.icon,
    required this.colorCode,
    required this.questionCount,
    required this.favoritesCount,
     this.createdAt,
     this.updatedAt,
  });
  factory Category.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    // Handle potential null or missing fields with default values
    final timestamp = data?['createdAt'] as Timestamp?;
    final timestamp2 = data?['updatedAt'] as Timestamp?;

    return Category(
      id: doc.id,
      title: data?['title'] ?? '',
      // icon: data?['icon'] ?? '✨',
      colorCode:
          data?['colorCode'] ?? '#FFFFFF', // Use a standard default color
      questionCount: data?['questionCount'] ?? 0,
      favoritesCount: data?['favoritesCount'] ?? 0,
      // Convert Firestore Timestamp to Dart DateTime
      createdAt: timestamp?.toDate() ?? DateTime.now(),
      updatedAt: timestamp2?.toDate() ?? DateTime.now(),
    );
  }

  /// Converts the Category object into a Map suitable for writing to Firestore.
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      // 'icon': icon,
      'colorCode': colorCode,
      'questionCount': questionCount,
      'favoritesCount': favoritesCount,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
