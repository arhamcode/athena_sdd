import 'package:flutter/foundation.dart';

import '../../../locator.dart';
import '../services/authentication_service.dart';

class LoginController extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  bool loading = false;

  Future<void> attempt(String username, String password) async {
    try {
      loading = true;
      notifyListeners();
      await _authenticationService.login(username, password);
    } catch (e) {
      rethrow;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
