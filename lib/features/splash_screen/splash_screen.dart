import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../authentication/services/authentication_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future<void> _delayedProcess(BuildContext context) async {
    bool isLoggedIn = await locator<AuthenticationService>().isLoggedIn();

    await Future.delayed(const Duration(seconds: 2));

    if (isLoggedIn) {
      context.router.replaceNamed('/dashboard');
    } else {
      context.router.replaceNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    _delayedProcess(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Skin Disease Dignosis',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
