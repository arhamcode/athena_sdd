import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/alternatif_controller.dart';
import '../widgets/alternatif_name_field.dart';

class AddAlternatifPage extends StatelessWidget {
  final TextEditingController _alternatifNameField = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AddAlternatifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah penyakit kulit'),
      ),
      body: ChangeNotifierProvider<AlternatifController>(
        create: (context) => AlternatifController(),
        child: Consumer<AlternatifController>(
          builder: (context, controller, child) => Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(30),
              children: [
                AlternatifNameField(
                  controller: _alternatifNameField,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await controller
                            .addAlternatif(_alternatifNameField.text);
                        Navigator.of(context).pop(true);
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
