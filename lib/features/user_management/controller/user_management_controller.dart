import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../api_config.dart';
import '../../../locator.dart';
import '../../authentication/services/authentication_service.dart';
import '../model/user.dart';

class UserManagementController extends ChangeNotifier {
  String token = locator<AuthenticationService>().getToken();

  bool loading = false;
  bool apiFailed = false;

  List<User> allUser = [];

  UserManagementController() {
    fetchUser();
  }

  Future<void> fetchUser() async {
    loading = true;
    apiFailed = false;
    notifyListeners();

    try {
      var response = await http.get(
        apiEntrypoint.replace(path: '/user'),
        headers: {'Authorization': 'Bearer $token'},
      ).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        var responseDecode = convert.jsonDecode(response.body);
        allUser.clear();
        for (var i = 0; i < responseDecode.length; i++) {
          allUser.add(User.fromJson(responseDecode[i]));
        }
      } else {
        throw 'Something Error';
      }
    } catch (e) {
      apiFailed = true;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
