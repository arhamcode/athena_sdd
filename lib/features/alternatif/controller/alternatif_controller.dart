import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../api_config.dart';
import '../../../locator.dart';
import '../../authentication/services/authentication_service.dart';
import '../models/alternatif.dart';

class AlternatifController extends ChangeNotifier {
  String token = locator<AuthenticationService>().getToken();

  bool loading = false;

  List<Alternatif> allAlternatif = [];

  AlternatifController() {
    fetchAlternatif();
  }

  Future<void> fetchAlternatif() async {
    loading = true;
    notifyListeners();

    var response = await http.get(
      apiEntrypoint.replace(path: '/alternatif'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    allAlternatif.clear();
    for (var i = 0; i < responseDecode.length; i++) {
      allAlternatif.add(Alternatif.fromJson(responseDecode[i]));
    }

    loading = false;
    notifyListeners();
  }

  Future<void> addAlternatif(String name) async {
    var response = await http.post(
      apiEntrypoint.replace(path: '/alternatif'),
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'name': name,
      },
    );
    if (response.statusCode == 422) {
      throw 'Nama penyakit "$name" telah digunakan';
    }
    notifyListeners();
  }

  Future<void> deleteAlternatif(int id) async {
    var response = await http.delete(
      apiEntrypoint.replace(path: '/alternatif/$id'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    Alternatif deletedItem = Alternatif.fromJson(responseDecode);
    allAlternatif.removeWhere((alternatif) => deletedItem.id == alternatif.id);
    notifyListeners();
  }
}
