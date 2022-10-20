import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../api_config.dart';
import '../../../locator.dart';
import '../../authentication/services/authentication_service.dart';
import '../../kriteria/models/kriteria.dart';

class CheckUpController extends ChangeNotifier {
  String token = locator<AuthenticationService>().getToken();

  bool loading = false;

  List<Kriteria> allKriteria = [];

  List<int> selectedId = [];

  CheckUpController() {
    fetchKriteria();
  }

  addId(int id) {
    selectedId.add(id);
    notifyListeners();
  }

  removeId(int id) {
    selectedId.removeWhere((element) => element == id);
    notifyListeners();
  }

  Future<void> fetchKriteria() async {
    loading = true;
    notifyListeners();
    var response = await http.get(
      apiEntrypoint.replace(path: '/kriteria'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    allKriteria.clear();
    for (var i = 0; i < responseDecode.length; i++) {
      allKriteria.add(Kriteria.fromJson(responseDecode[i]));
    }
    loading = false;
    notifyListeners();
  }
}
