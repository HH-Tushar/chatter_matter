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
  String? id;
  String userId;
  String planId;

  // Stripe Identifiers
  String stripeEventId;
  String stripeCheckoutSessionId;
  String stripePaymentIntentId;
  String? stripeCustomerId;
  String? stripeInvoiceId;
  String? stripeSubscriptionId;
  String? stripePriceId;

  // Payment Info
  int amountSubtotal;
  int amountTotal;
  int packageDuration;
  String currency;
  String paymentStatus; // 'paid' | 'unpaid' | 'no_payment_required'
  String status; // 'complete' | 'open' | 'expired'

  // Environment
  bool livemode;

  // Metadata
  String? userEmail;
  Map<String, String>? metadata;

  // Timestamps
  DateTime stripeCreatedAt;
  DateTime createdAt;

  SubscriptionTransaction({
    this.id,
    required this.userId,
    required this.planId,
    required this.stripeEventId,
    required this.stripeCheckoutSessionId,
    required this.stripePaymentIntentId,
    this.stripeCustomerId,
    this.stripeInvoiceId,
    this.stripeSubscriptionId,
    this.stripePriceId,
    required this.amountSubtotal,
    required this.amountTotal,
    required this.packageDuration,
    required this.currency,
    required this.paymentStatus,
    required this.status,
    required this.livemode,
    this.userEmail,
    this.metadata,
    required this.stripeCreatedAt,
    required this.createdAt,
  });

  factory SubscriptionTransaction.fromJson(Map<String, dynamic> json) {
    DateTime parseTimestamp(Map<String, dynamic> ts) {
      final seconds = ts['_seconds'] as int? ?? 0;
      final nanoseconds = ts['_nanoseconds'] as int? ?? 0;
      return DateTime.fromMillisecondsSinceEpoch(
        seconds * 1000 + (nanoseconds / 1000000).round(),
      );
    }

    return SubscriptionTransaction(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      planId: json['planId'] as String,
      stripeEventId: json['stripeEventId'] as String,
      stripeCheckoutSessionId: json['stripeCheckoutSessionId'] as String,
      stripePaymentIntentId: json['stripePaymentIntentId'] as String,
      stripeCustomerId: json['stripeCustomerId'] as String?,
      stripeInvoiceId: json['stripeInvoiceId'] as String?,
      stripeSubscriptionId: json['stripeSubscriptionId'] as String?,
      stripePriceId: json['stripePriceId'] as String?,
      amountSubtotal: json['amountSubtotal'] as int,
      amountTotal: json['amountTotal'] as int,
      packageDuration: json['packageDuration'] as int,
      currency: json['currency'] as String,
      paymentStatus: json['paymentStatus'] as String,
      status: json['status'] as String,
      livemode: json['livemode'] as bool,
      userEmail: json['userEmail'] as String?,
      metadata: json['metadata'] != null
          ? Map<String, String>.from(json['metadata'] as Map)
          : null,
      stripeCreatedAt: parseTimestamp(json['stripeCreatedAt']),
      createdAt: parseTimestamp(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'planId': planId,
      'stripeEventId': stripeEventId,
      'stripeCheckoutSessionId': stripeCheckoutSessionId,
      'stripePaymentIntentId': stripePaymentIntentId,
      'stripeCustomerId': stripeCustomerId,
      'stripeInvoiceId': stripeInvoiceId,
      'stripeSubscriptionId': stripeSubscriptionId,
      'stripePriceId': stripePriceId,
      'amountSubtotal': amountSubtotal,
      'amountTotal': amountTotal,
      'packageDuration': packageDuration,
      'currency': currency,
      'paymentStatus': paymentStatus,
      'status': status,
      'livemode': livemode,
      'userEmail': userEmail,
      'metadata': metadata,
      'stripeCreatedAt': stripeCreatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
