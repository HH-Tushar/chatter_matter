import 'dart:convert';

class DashboardStatus {
    final bool success;
    final int totalUsers;
    final int totalQuestions;
    final int favCount;
    final int totalFreeUsers;
    final int totalVipUsers;
    final int totalStandardUsers;

    DashboardStatus({
        required this.success,
        required this.totalUsers,
        required this.totalQuestions,
        required this.favCount,
        required this.totalFreeUsers,
        required this.totalVipUsers,
        required this.totalStandardUsers,
    });

    factory DashboardStatus.fromRawJson(String str) => DashboardStatus.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DashboardStatus.fromJson(Map<String, dynamic> json) => DashboardStatus(
        success: json["success"],
        totalUsers: json["totalUsers"],
        totalQuestions: json["totalQuestions"],
        favCount: json["favCount"],
        totalFreeUsers: json["totalFreeUsers"],
        totalVipUsers: json["totalVipUsers"],
        totalStandardUsers: json["totalStandardUsers"],
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
