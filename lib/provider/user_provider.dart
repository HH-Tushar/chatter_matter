import 'dart:math';

import 'package:chatter_matter_admin/application/model/user_model.dart';
import 'package:chatter_matter_admin/application/repo/app_user_repo.dart';
import 'package:chatter_matter_admin/env.dart';
import 'package:flutter/material.dart';

import '../core/api_handler.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUsers();
  }

  bool isLoading = false;
  bool isPaginating = false;
  bool reachEnd = false;
  final _appUserRepo = AppUserRepo();

  String? currentSubscriptionType;
  bool? isActive;

  UserList? _userList;
  List<AppUser> appUsers = [];

  init() {}

  void getUsers() async {
    if (appUsers.isEmpty) {
      isLoading = true;
      isPaginating = true;
    }
    notifyListeners();
    final (data, error) = await _appUserRepo.getUserList(
      subscriptionType: currentSubscriptionType,
      pageToken: _userList?.nextPageToken,
      isActive: isActive,
    );
    if (data != null) {
      appUsers = data.data;
    }

    isLoading = false;
    isPaginating = false;
    notifyListeners();
  }

  void toggleSubscriptionType(SubscriptionType? type) {
    if (type == SubscriptionType.all) {
      currentSubscriptionType = null;
    } else if (type != null) {
      currentSubscriptionType = type.name;
    }
    _userList = null;
    getUsers();
  }

  void toggleActiveType(bool? status) {
    if (status != null) {
      isActive = status;
      // currentSubscriptionType = null;
      _userList = null;
      getUsers();
    } else {
      isActive = null;
    }
  }

  Future<Attempt<AppUser>> findUser(String email) async {
    isLoading = true;
    notifyListeners();

    final (user, error) = await _appUserRepo.getUser(email: email);
    isLoading = false;
   notifyListeners();
    return (user, error);
  }
}
