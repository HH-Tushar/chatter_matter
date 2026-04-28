class SubscriptionTransactionResponse {
  int count;
  String? nextPageToken;
  List<SubscriptionTransaction> data;

  SubscriptionTransactionResponse({
    required this.count,
    this.nextPageToken,
    required this.data,
  });

  factory SubscriptionTransactionResponse.fromJson(Map<String, dynamic> json) {
    return SubscriptionTransactionResponse(
      count: json['count'] as int,
      nextPageToken: json['nextPageToken'] as String?,
      data: (json['data'] as List)
          .map(
            (item) =>
                SubscriptionTransaction.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'nextPageToken': nextPageToken,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}


class SubscriptionTransaction {
  final String? id;
  final String userId;
  final String productId;
  final String store;
  final double price;
  final String currency;
  final String originalTransactionId;
  final String transactionId;
  final String status; // 'paid' | 'unpaid' | 'expired'
  final String countryCode;
  final String? userEmail;
  final Map<String, String>? metadata;
  final DateTime purchasedAt;
  final DateTime expiresAt;
  final DateTime createdAt;

  SubscriptionTransaction({
    this.id,
    required this.userId,
    required this.productId,
    required this.store,
    required this.price,
    required this.currency,
    required this.originalTransactionId,
    required this.transactionId,
    required this.status,
    required this.countryCode,
    this.userEmail,
    this.metadata,
    required this.purchasedAt,
    required this.expiresAt,
    required this.createdAt,
  });

  // Convert JSON Map to Model
  factory SubscriptionTransaction.fromJson(Map<String, dynamic> json, [String? docId]) {
    return SubscriptionTransaction(
      id: docId ?? json['id'] as String?,
      userId: json['userId'] ?? '',
      productId: json['productId'] ?? '',
      store: json['store'] ?? '',
      // Handles both int and double from JSON
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] ?? '',
      originalTransactionId: json['originalTransactionId'] ?? '',
      transactionId: json['transactionId'] ?? '',
      status: json['status'] ?? 'unpaid',
      countryCode: json['countryCode'] ?? '',
      userEmail: json['userEmail'] as String?,
      metadata: json['metadata'] != null 
          ? Map<String, String>.from(json['metadata']) 
          : null,
      purchasedAt: _parseDate(json['purchasedat']),
      expiresAt: _parseDate(json['expiresAt']),
      createdAt: _parseDate(json['createdAt']),
    );
  }

  // Convert Model to JSON Map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productId': productId,
      'store': store,
      'price': price,
      'currency': currency,
      'originalTransactionId': originalTransactionId,
      'transactionId': transactionId,
      'status': status,
      'countryCode': countryCode,
      'userEmail': userEmail,
      'metadata': metadata,
      'purchasedat': purchasedAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Helper to handle various Date formats (String or Firestore Timestamp)
  static DateTime _parseDate(dynamic date) {
    if (date == null) return DateTime.now();
    if (date is String) return DateTime.parse(date);
    // If you are using Cloud Firestore package, dates come back as Timestamps
    if (date.runtimeType.toString() == 'Timestamp') return date.toDate();
    return DateTime.now();
  }
}