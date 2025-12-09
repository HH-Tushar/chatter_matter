import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModelList {
  final bool success;
  final List<QuestionModel> data;

  QuestionModelList({required this.success, required this.data});

  factory QuestionModelList.fromJson(Map<String, dynamic> json) =>
      QuestionModelList(
        success: json["success"],
        data: List<QuestionModel>.from(
          json["data"].map((x) => QuestionModel.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class QuestionModel {
  final String id;
  final String categoryId;
  final bool isBabyQuestion;
  final String title;
  final int favoritesCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  QuestionModel({
    required this.id,
    required this.title,
    required this.favoritesCount,
    required this.isBabyQuestion,
    required this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json, {String? id}) {
    final createdAtTimestamp = json['createdAt'];
    final updatedAtTimestamp = json['updatedAt'];

    return QuestionModel(
      id: id ?? json['id'] ?? '',
      title: json['title'] ?? '',
      isBabyQuestion: json['isBabyQuestion'] ?? false,
      categoryId: json['categoryId'] ?? '',
      favoritesCount: json['favoritesCount'] ?? 0,

      createdAt: createdAtTimestamp is Timestamp
          ? createdAtTimestamp.toDate()
          : createdAtTimestamp is String
          ? DateTime.tryParse(createdAtTimestamp)
          : null,

      updatedAt: updatedAtTimestamp is Timestamp
          ? updatedAtTimestamp.toDate()
          : updatedAtTimestamp is String
          ? DateTime.tryParse(updatedAtTimestamp)
          : null,
    );
  }

  /// Converts the QuestionModel object into a Map suitable for writing to Firestore.
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'favoritesCount': favoritesCount,
      'categoryId': categoryId,
      'isBabyQuestion': isBabyQuestion,
    };
  }
}
