import 'package:cloud_firestore/cloud_firestore.dart';



class DeleteReqResponse {
  int count;
  String? nextPageToken;
  List<DeleteRequestModel> data;

  DeleteReqResponse({
    required this.count,
    this.nextPageToken,
    required this.data,
  });

  factory DeleteReqResponse.fromJson(Map<String, dynamic> json) {
    return DeleteReqResponse(
      count: json['count'] as int,
      nextPageToken: json['nextPageToken'] as String?,
      data: (json['data'] as List)
          .map(
            (item) =>
                DeleteRequestModel.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'count': count,
  //     'nextPageToken': nextPageToken,
  //     'data': data.map((item) => item.toJson()).toList(),
  //   };
  // }
}









class DeleteRequestModel {
  final String id;
  final String userId;
  final String? email;
  final String? name;
  final String reason;
  final String status; // pending | approved | rejected | deleted
  final DateTime requestedAt;

  DeleteRequestModel({
    required this.id,
    required this.userId,
    this.email,
    this.name,
    required this.reason,
    required this.status,
    required this.requestedAt,
  });

  /// Create model from Firestore document
  factory DeleteRequestModel.fromJson(Map<String, dynamic> json) {
    DateTime parseTimestamp(Map<String, dynamic> ts) {
      final seconds = ts['_seconds'] as int? ?? 0;
      final nanoseconds = ts['_nanoseconds'] as int? ?? 0;
      return DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000 + (nanoseconds / 1000000).round(),
      );
    }

    return DeleteRequestModel(
      id: json["id"],
      userId: json['userId'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      reason: json['reason'] as String,
      status: json['status'] as String,
      // requestedAt: (json['requestedAt'] as Timestamp).toDate(),
      requestedAt: parseTimestamp(json["requestedAt"]),
    );
  }

  /// Convert model to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'reason': reason,
      'status': status,
      'requestedAt': Timestamp.fromDate(requestedAt),
    };
  }
}
