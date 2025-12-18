import 'dart:convert';

import 'package:chatter_matter_admin/application/model/subscription_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../../core/api_handler.dart';
import '../../env.dart';

class SubscriptionRepo {
  //add question
  Future<Attempt<SubscriptionPackageModel>> addSubscriptionPlan(
    SubscriptionPackageModel item, // example: https://yourapi.com/api
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return failed(SessionExpired());

      final token = await user.getIdToken();

      final url = Uri.parse("$baseUrl/addQuestions");

      final body = jsonEncode(item.toJson());

      final response = await http
          .post(
            url,
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            body: body,
          )
          .timeout(const Duration(seconds: 10)); // Prevents infinite waiting

      if (response.statusCode == 200 || response.statusCode == 201) {
        return success(
          SubscriptionPackageModel.fromJson(jsonDecode(response.body)),
        );
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

  //add question
  Future<Attempt<bool>> updateSubscriptionPlan(
    SubscriptionPackageModel item, // example: https://yourapi.com/api
  ) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return failed(SessionExpired());

      final token = await user.getIdToken();

      final url = Uri.parse("$baseUrl/updatePackageModel?id=${item.id}");

      final body = jsonEncode(item.toJson());

      final response = await http
          .post(
            url,
            headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $token",
            },
            body: body,
          )
          .timeout(const Duration(seconds: 10)); // Prevents infinite waiting

      if (response.statusCode == 200 || response.statusCode == 201) {
        return success(true);
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

  //get question paginator

  Future<Attempt<SubscriptionPackageList>> getPackages() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return failed(SessionExpired());

      final token = await user.getIdToken();

      final uri = "$baseUrl/getPackages";

      final url = Uri.parse(uri);

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
        return success(
          SubscriptionPackageList.fromJson(jsonDecode(response.body)),
        );
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
