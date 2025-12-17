import 'package:chatter_matter_admin/application/model/user_model.dart';
import 'package:chatter_matter_admin/application/repo/app_user_repo.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserProvider() {}

  bool isLoading = false;
  bool isPaginating = false;
  bool reachEnd = false;
  final _appUserRepo = AppUserRepo();

  UserList? userList;
  List<AppUser> appUsers = [];

  init() {}

  void getUsers() async {
    
    final (data, error) = await _appUserRepo.getUserList();
  }
}
