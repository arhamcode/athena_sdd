import 'package:hive/hive.dart';

import 'user_role.dart';

part 'auth_user.g.dart';

@HiveType(typeId: 2)
class AuthUser {
  @HiveField(0)
  String name;
  @HiveField(1)
  String userName;
  @HiveField(2)
  UserRole role;
  @HiveField(3)
  String token;

  AuthUser({
    required this.name,
    required this.userName,
    required this.role,
    required this.token,
  });

  factory AuthUser.fromJson(dynamic json, String token) {
    return AuthUser(
      name: json['name'],
      userName: json['username'],
      role: json['role'] == 'admin' ? UserRole.admin : UserRole.user,
      token: token,
    );
  }
}
