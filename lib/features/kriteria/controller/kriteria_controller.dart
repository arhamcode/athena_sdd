import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../api_config.dart';
import '../../../locator.dart';
import '../../authentication/services/authentication_service.dart';
import '../models/kriteria.dart';

class KriteriaController extends ChangeNotifier {
  String token = locator<AuthenticationService>().getToken();

  bool loading = false;

  List<Kriteria> allKriteria = [];

  KriteriaController() {
    fetchKriteria();
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

  Future<void> addKriteria(String name, double belief) async {
    var response = await http.post(
      apiEntrypoint.replace(path: '/kriteria'),
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'name': name,
        'belief': belief.toString(),
      },
    );
    if (response.statusCode == 422) {
      throw 'Nama gejala "$name" telah digunakan';
    }
    notifyListeners();
  }

  Future<void> deleteKriteria(int id) async {
    var response = await http.delete(
      apiEntrypoint.replace(path: '/kriteria/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    Kriteria deletedItem = Kriteria.fromJson(responseDecode);
    allKriteria.removeWhere((kriteria) => deletedItem.id == kriteria.id);
    notifyListeners();
  }
}
