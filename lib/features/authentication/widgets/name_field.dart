import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  final TextEditingController controller;

  const NameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        label: Text('Nama'),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi nama';
        }
        return null;
      },
    );
  }
}
