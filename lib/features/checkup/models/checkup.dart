class CheckUp {
  final String sessionCode;
  final String namaPenyakit;
  final DateTime checkupDate;
  final String userName;

  CheckUp({
    required this.sessionCode,
    required this.namaPenyakit,
    required this.checkupDate,
    required this.userName,
  });

  factory CheckUp.fromJson(json) {
    return CheckUp(
      sessionCode: json['code'],
      namaPenyakit: json['penyakit']['name'],
      checkupDate: DateTime.parse(json['created_at']),
      userName: json['user']['name'],
    );
  }
}
