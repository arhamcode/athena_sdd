import 'package:ath_mobile/features/kriteria/models/kriteria.dart';

class Alternatif {
  final int id;
  final String code;
  final String name;
  final List<Kriteria> gejala;

  Alternatif({
    required this.id,
    required this.code,
    required this.name,
    this.gejala = const [],
  });

  factory Alternatif.fromJson(json) {
    List<Kriteria> gejala = [];

    if (json['gejala'] != null) {
      for (var i = 0; i < json['gejala'].length; i++) {
        gejala.add(Kriteria.fromJson(json['gejala'][i]));
      }
    }

    return Alternatif(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      gejala: gejala,
    );
  }
}
