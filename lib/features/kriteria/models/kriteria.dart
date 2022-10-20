class Kriteria {
  final int id;
  final String code;
  final String name;
  final double belief;
  final double plausibility;

  Kriteria({
    required this.id,
    this.code = '',
    required this.name,
    required this.belief,
    required this.plausibility,
  });

  factory Kriteria.fromJson(dynamic json) {
    return Kriteria(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      belief: double.parse(json['belief']),
      plausibility: double.parse(json['plausibility']),
    );
  }
}
