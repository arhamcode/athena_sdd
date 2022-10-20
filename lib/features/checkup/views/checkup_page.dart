import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/checkup_controller.dart';

class CheckUpPage extends StatelessWidget {
  const CheckUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckUpController>(
      create: (context) => CheckUpController(),
      child: Consumer<CheckUpController>(
        builder: (context, controller, child) => Scaffold(
          appBar: AppBar(
            title: Text('Cek Penyakit Kulit [${controller.selectedId.length}]'),
            actions: [
              IconButton(
                onPressed: () {
                  if (controller.selectedId.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text('Mohon pilih gejala.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Tutup'),
                          )
                        ],
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.send),
              )
            ],
          ),
          body: controller.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => ListTile(
                    leading: Checkbox(
                      onChanged: (value) {
                        if (value!) {
                          controller.addId(controller.allKriteria[index].id);
                        } else {
                          controller.removeId(controller.allKriteria[index].id);
                        }
                      },
                      value: controller.selectedId.contains(
                        controller.allKriteria[index].id,
                      ),
                    ),
                    title: Text(controller.allKriteria[index].name),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: controller.allKriteria.length,
                ),
        ),
      ),
    );
  }
}
