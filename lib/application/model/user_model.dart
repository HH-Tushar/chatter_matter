import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserList {
  final int count;
  final String? nextPageToken;
  final List<AppUser> data;

  UserList({
    required this.count,
    required this.nextPageToken,
    required this.data,
  });

  factory UserList.fromRawJson(String str) =>
      UserList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    count: json["count"],
    nextPageToken: json["nextPageToken"],
    data: List<AppUser>.from(json["data"].map((x) => AppUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "nextPageToken": nextPageToken,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AppUser {
  final String id;
  final String role;
  final dynamic subscriptionStartedAt;
  final bool isEmailVerified;
  final dynamic createdAt;
  final String uid;
  final int lastLoginAt;
  final String provider;
  final String subscriptionType;
  final String imageUrl;
  final dynamic subscriptionEndsAt;
  final String name;
  final int journalCount;
  final int favoriteCount;
  final String age;
  final String email;
  final bool isActive;
  // final int updatedAt;

  AppUser({
    required this.id,
    required this.role,
    required this.subscriptionStartedAt,
    required this.isEmailVerified,
    required this.favoriteCount,
    required this.createdAt,
    required this.uid,
    required this.lastLoginAt,
    required this.provider,
    required this.subscriptionType,
    required this.imageUrl,
    required this.subscriptionEndsAt,
    required this.name,
    required this.age,
    required this.email,
    required this.journalCount,
    required this.isActive,
    // required this.updatedAt,
  });

  factory AppUser.fromRawJson(String str) => AppUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
    id: json["id"],
    role: json["role"],

    // subscriptionStartedAt: json["subscriptionStartedAt"] != null
    //     ? (json["subscriptionStartedAt"] as Timestamp).toDate()
    //     : null,
    subscriptionStartedAt: DateTime.now(),
    // subscriptionEndsAt: DateTime.now(),
    createdAt: DateTime.now(),
    isEmailVerified: json["isEmailVerified"],

    journalCount: json["journalCount"] ?? 0,
    favoriteCount: json["favoriteCount"] ?? "0",
    uid: json["uid"],
    lastLoginAt: json["lastLoginAt"],
    provider: json["provider"],
    subscriptionType: json["subscriptionType"],
    imageUrl: json["imageUrl"],

    subscriptionEndsAt: json["subscriptionEndsAt"],
    name: json["name"],
    age: json["age"] ?? "",
    isActive: json["isActive"],
    email: json["email"],
    // updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
    "subscriptionStartedAt": subscriptionStartedAt,
    "isEmailVerified": isEmailVerified,
    "createdAt": createdAt,
    "uid": uid,
    "lastLoginAt": lastLoginAt,
    "provider": provider,
    "subscriptionType": subscriptionType,
    "imageUrl": imageUrl,
    "subscriptionEndsAt": subscriptionEndsAt,
    "name": name,
    "age": age,
    "email": email,
    // "updatedAt": updatedAt,
  };
}
