import 'package:flutter/material.dart';

class AlternatifNameField extends StatelessWidget {
  final TextEditingController controller;
  const AlternatifNameField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        label: Text('Nama penyakit kulit'),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi nama penyakit kulit';
        }
        return null;
      },
    );
  }
}
