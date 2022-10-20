import 'package:flutter/foundation.dart';

import '../../../locator.dart';
import '../services/authentication_service.dart';

class RegisterController extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  bool loading = false;

  Future<void> attempt(String name, String username, String password) async {
    try {
      loading = true;
      notifyListeners();
      await _authenticationService.register(name, username, password);
    } catch (e) {
      rethrow;
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
