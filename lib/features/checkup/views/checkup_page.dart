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
                  } else {
                    controller.sendCheckUp();
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
              : controller.alternatif != null
                  ? Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Hasil Pengecekan',
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Penyakit: ${controller.alternatif!.name}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              controller.resetForm();
                            },
                            child: const Text('Lakukan pengecekan ulang'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Kembali ke dashboard'),
                          )
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        leading: Checkbox(
                          onChanged: (value) {
                            if (value!) {
                              controller
                                  .addId(controller.allKriteria[index].id);
                            } else {
                              controller
                                  .removeId(controller.allKriteria[index].id);
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
