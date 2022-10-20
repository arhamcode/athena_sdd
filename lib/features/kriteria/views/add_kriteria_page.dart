import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/kriteria_controller.dart';
import '../widgets/kriteria_name_field.dart';
import '../widgets/kriteria_value_field.dart';

class AddKriteriaPage extends StatelessWidget {
  final TextEditingController _kriteriaNameField = TextEditingController();
  final TextEditingController _kriteriaValueField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddKriteriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah kriteria'),
      ),
      body: ChangeNotifierProvider<KriteriaController>(
        create: (context) => KriteriaController(),
        child: Consumer<KriteriaController>(
          builder: (context, controller, child) => Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                KriteriaNameField(
                  controller: _kriteriaNameField,
                ),
                const SizedBox(height: 30),
                KriteriaValueField(
                  controller: _kriteriaValueField,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller
                          .addKriteria(
                            _kriteriaNameField.text,
                            double.parse(_kriteriaValueField.text),
                          )
                          .then(
                            (value) => Navigator.of(context).pop(true),
                          );
                    }
                  },
                  child: const Text(
                    'Tambah',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
