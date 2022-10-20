import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../api_config.dart';
import '../../../locator.dart';
import '../../authentication/services/authentication_service.dart';
import '../../checkup/models/checkup.dart';

class DashboardController extends ChangeNotifier {
  String token = locator<AuthenticationService>().getToken();

  List<CheckUp> allCheckUp = [];

  bool loading = false;

  DashboardController() {
    fetchCheckUp();
  }

  Future<void> fetchCheckUp() async {
    loading = true;
    notifyListeners();

    var response = await http.get(
      apiEntrypoint.replace(path: '/checkup'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    allCheckUp.clear();
    for (var i = 0; i < responseDecode.length; i++) {
      allCheckUp.add(CheckUp.fromJson(responseDecode[i]));
    }

    loading = false;
    notifyListeners();
  }
}
