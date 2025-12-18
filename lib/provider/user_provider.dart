import 'package:chatter_matter_admin/application/model/user_model.dart';
import 'package:chatter_matter_admin/application/repo/app_user_repo.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {
    getUsers();
  }

  bool isLoading = false;
  bool isPaginating = false;
  bool reachEnd = false;
  final _appUserRepo = AppUserRepo();

  UserList? _userList;
  List<AppUser> appUsers = [];

  init() {}

  void getUsers() async {
    if (appUsers.isEmpty) {
      isLoading = true;
      isPaginating = true;
    }
    notifyListeners();
    final (data, error) = await _appUserRepo.getUserList();
    if (data != null) {
      appUsers = data.data;
    }

    isLoading = false;
    isPaginating = false;
    notifyListeners();
  }
}
