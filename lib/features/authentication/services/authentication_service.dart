import 'dart:convert' as convert;

import 'package:ath_mobile/api_config.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../model/auth_user.dart';

abstract class IAuthenticationService {
  Future<bool> isLoggedIn();
  Future<void> login(String username, String password);
  Future<void> register(String name, String username, String password);
  Future<AuthUser> fetchUser(String token);
  AuthUser getUser();
  Future<void> logout();
  String getToken();
}

class AuthenticationService implements IAuthenticationService {
  final Uri _entrypoint = apiEntrypoint;
  final Box<AuthUser> authBox;

  AuthenticationService({required this.authBox});

  @override
  Future<bool> isLoggedIn() async {
    if (authBox.isEmpty) return false;
    return true;
  }

  @override
  Future<void> login(String username, String password) async {
    try {
      Uri uri = _entrypoint.replace(path: '/auth/login');
      http.Response response = await http.post(uri, body: {
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200) {
        var responseDecoded = convert.jsonDecode(response.body);
        String token = responseDecoded['token'];
        await fetchUser(token);
      } else if (response.statusCode == 401) {
        var responseDecoded = convert.jsonDecode(response.body);
        String message = responseDecoded['message'];
        throw message;
      } else {
        throw 'API ${response.statusCode} $uri';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> register(String name, String username, String password) async {
    try {
      Uri uri = _entrypoint.replace(path: '/auth/register');
      http.Response response = await http.post(uri, body: {
        "name": name,
        "username": username,
        "password": password,
      });

      if (response.statusCode == 200) {
        var responseDecoded = convert.jsonDecode(response.body);
        String token = responseDecoded['token'];
        await fetchUser(token);
      } else if (response.statusCode == 422) {
        throw 'Username telah digunakan.';
      } else {
        throw 'API "/auth/register"';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    await authBox.clear();
  }

  @override
  Future<AuthUser> fetchUser(String token) async {
    try {
      Uri uri = _entrypoint.replace(path: '/auth/user');
      http.Response response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        var responseDecoded = convert.jsonDecode(response.body);
        return await _storeAuth(AuthUser.fromJson(responseDecoded, token));
      } else {
        throw 'API ${response.statusCode} $uri';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  AuthUser getUser() {
    return authBox.getAt(0)!;
  }

  @override
  String getToken() {
    AuthUser? authUser = authBox.getAt(0);
    return authUser!.token;
  }

  Future<AuthUser> _storeAuth(AuthUser authUser) async {
    await authBox.clear();
    await authBox.add(authUser);
    return authUser;
  }
}
