import 'package:flutter/material.dart';

class KriteriaValueField extends StatelessWidget {
  final TextEditingController controller;
  const KriteriaValueField({
    super.key,
    required,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      decoration: const InputDecoration(
        label: Text('Nilai'),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Mohon isi nama';
        }
        if (double.tryParse(value) == null) {
          return 'Mohon isi nilai dengan format desimal dengan tanda titik (.)';
        }
        if (double.parse(value) <= 0 || double.parse(value) >= 1) {
          return 'Mohon isi nilai antara 0 sampai 1, contoh 0.1';
        }

        return null;
      },
    );
  }
}
