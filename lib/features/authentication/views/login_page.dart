import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/login_controller.dart';
import '../widgets/login_button.dart';
import '../widgets/page_title.dart';
import '../widgets/password_field.dart';
import '../widgets/register_button.dart';
import '../widgets/username_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _usernameField = TextEditingController();
  final TextEditingController _passwordField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: ChangeNotifierProvider<LoginController>(
              create: (context) => LoginController(),
              child: Consumer<LoginController>(
                builder: (context, controller, child) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const PageTitle(title: 'Login'),
                      const SizedBox(height: 15),
                      UsernameField(controller: _usernameField),
                      const SizedBox(height: 15),
                      PasswordField(controller: _passwordField),
                      const SizedBox(height: 15),
                      LoginButton(
                        loadingState: controller.loading,
                        onPressed: () async {
                          if (controller.loading) return;

                          if (_formKey.currentState!.validate()) {
                            try {
                              await controller.attempt(
                                _usernameField.text,
                                _passwordField.text,
                              );
                              context.router.replaceNamed('/dashboard');
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    e.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }
                          }
                        },
                      ),
                      const SizedBox(height: 15),
                      RegisterButton(
                        onPressed: () {
                          if (controller.loading) return;

                          context.router.pushNamed('/register');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
