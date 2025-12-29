import 'dart:convert';

class BarStack {
  final String month;
  final int totalUsers;
  final double totalRevenue;

  BarStack({
    required this.month,
    required this.totalUsers,
    required this.totalRevenue,
  });

  factory BarStack.fromJson(Map<String, dynamic> json) => BarStack(
    month: json['month'],
    totalUsers: json['totalUsers'],
    totalRevenue: (json['totalRevenue'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    'month': month,
    'totalUsers': totalUsers,
    'totalRevenue': totalRevenue,
  };
}

class DashboardStatus {
  final bool success;
  final int totalUsers;
  final int totalQuestions;
  final int favCount;
  final int totalFreeUsers;
  final int totalVipUsers;
  final int totalStandardUsers;
  final List<BarStack> barStacks;

  DashboardStatus({
    required this.success,
    required this.totalUsers,
    required this.totalQuestions,
    required this.favCount,
    required this.totalFreeUsers,
    required this.totalVipUsers,
    required this.totalStandardUsers,
    required this.barStacks,
  });

  factory DashboardStatus.fromRawJson(String str) =>
      DashboardStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardStatus.fromJson(Map<String, dynamic> json) =>
      DashboardStatus(
        success: json["success"],
        totalUsers: json["totalUsers"],
        totalQuestions: json["totalQuestions"],
        favCount: json["favCount"],
        totalFreeUsers: json["totalFreeUsers"],
        totalVipUsers: json["totalVipUsers"],
        totalStandardUsers: json["totalStandardUsers"],
        barStacks: json["barStacks"] != null
            ? List<BarStack>.from(
                json["barStacks"].map((x) => BarStack.fromJson(x)),
              )
            : [], // default empty list if null
      );

  Map<String, dynamic> toJson() => {
    "success": success,
    "totalUsers": totalUsers,
    "totalQuestions": totalQuestions,
    "favCount": favCount,
    "totalFreeUsers": totalFreeUsers,
    "totalVipUsers": totalVipUsers,
    "totalStandardUsers": totalStandardUsers,
  };
}
