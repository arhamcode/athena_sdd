import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Password'),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi password.';
        }
        return null;
      },
      textInputAction: TextInputAction.done,
    );
  }
}
