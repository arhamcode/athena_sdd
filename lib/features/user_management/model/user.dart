class User {
  final String name;
  final String username;
  final DateTime registerDate;

  User({
    required this.name,
    required this.username,
    required this.registerDate,
  });

  factory User.fromJson(json) {
    return User(
      name: json['name'],
      username: json['username'],
      registerDate: DateTime.parse(json['created_at']),
    );
  }
}
