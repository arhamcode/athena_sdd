import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../api_config.dart';
import '../../../locator.dart';
import '../../alternatif/models/alternatif.dart';
import '../../authentication/services/authentication_service.dart';
import '../../kriteria/models/kriteria.dart';

class KriteriaAlternatifController extends ChangeNotifier {
  String token = locator<AuthenticationService>().getToken();
  final int penyakitId;

  // List<Alternatif> allAlternatif = [];

  KriteriaAlternatifController({required this.penyakitId}) {
    // fetchAlternatif();
  }

  Future<List<Kriteria>> fetchAvailableGejala() async {
    var response = await http.get(
      apiEntrypoint.replace(
        path: '/alternatifkriteria/$penyakitId',
        queryParameters: {'except': '1'},
      ),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    List<Kriteria> availableGejala = [];
    for (var i = 0; i < responseDecode.length; i++) {
      availableGejala.add(Kriteria.fromJson(responseDecode[i]));
    }
    return availableGejala;
    // notifyListeners();
  }

  // Future<void> fetchAlternatif() async {
  //   var response = await http.get(
  //     apiEntrypoint.replace(path: '/alternatif'),
  //     headers: {'Authorization': 'Bearer $token'},
  //   );
  //   var responseDecode = convert.jsonDecode(response.body);
  //   allAlternatif.clear();
  //   for (var i = 0; i < responseDecode.length; i++) {
  //     allAlternatif.add(Alternatif.fromJson(responseDecode[i]));
  //   }
  //   notifyListeners();
  // }

  Future<void> addGejala(int gejalaId) async {
    var response = await http.post(
      apiEntrypoint.replace(path: '/alternatifkriteria/$penyakitId/$gejalaId'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    Alternatif updatedAlternatif = Alternatif.fromJson(responseDecode);
    notifyListeners();
  }

  Future<void> deleteGejala(int gejalaId) async {
    var response = await http.delete(
      apiEntrypoint.replace(path: '/alternatifkriteria/$penyakitId/$gejalaId'),
      headers: {'Authorization': 'Bearer $token'},
    );
    var responseDecode = convert.jsonDecode(response.body);
    Alternatif updatedAlternatif = Alternatif.fromJson(responseDecode);
    notifyListeners();
  }
}
