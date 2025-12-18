import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import '../../core/api_handler.dart';
import '../../env.dart';
import '../model/user_model.dart';

class AppUserRepo {




  Future<Attempt<UserList>> getUserList() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return failed(SessionExpired());

      final token = await user.getIdToken();

      final url = Uri.parse("$baseUrl/getUsers");

      final response = await http
          .get(
            url,
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
          )
          .timeout(const Duration(seconds: 10)); // Prevents infinite waiting

      if (response.statusCode == 200 || response.statusCode == 201) {
        return success(UserList.fromJson(jsonDecode(response.body)));
      } else if (response.statusCode == 401) {
        return failed(SessionExpired());
      } else if (response.statusCode == 403) {
        return failed(UnauthorizeAccess());
      }
      return failed(Failure(title: "Something went wrong"));
    } on http.ClientException catch (e) {
      return failed(Failure(title: e.message));
    } on FormatException catch (e) {
      return failed(Failure(title: e.message));
    } on Exception catch (e) {
      return failed(Failure(title: e.toString()));
    }
  }





}