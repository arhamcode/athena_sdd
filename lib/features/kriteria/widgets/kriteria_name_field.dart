import 'package:flutter/material.dart';

class KriteriaNameField extends StatelessWidget {
  final TextEditingController controller;
  const KriteriaNameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        label: Text('Nama gejala'),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi nama gejala';
        }
        return null;
      },
    );
  }
}
