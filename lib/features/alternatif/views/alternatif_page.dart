import 'package:ath_mobile/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:auto_route/auto_route.dart';

import '../controller/alternatif_controller.dart';
import 'add_alternatif_page.dart';

class AlternatifPage extends StatelessWidget {
  const AlternatifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AlternatifController>(
      create: (context) => AlternatifController(),
      child: Consumer<AlternatifController>(
        builder: (context, controller, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Alternatif'),
            actions: [
              IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddAlternatifPage(),
                  ));
                  controller.fetchAlternatif();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: ListView.separated(
            itemCount: controller.allAlternatif.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ListTile(
              title: Text(controller.allAlternatif[index].name),
              subtitle: Text('Kode ${controller.allAlternatif[index].code}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () async {
                      await context.router.push(KriteriaAlternatifRoute(
                        alternatif: controller.allAlternatif[index],
                      ));
                      controller.fetchAlternatif();
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                    ),
                    label: Text(
                      'Gejala (${controller.allAlternatif[index].gejala.length})',
                    ),
                  ),
                  IconButton(
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Hapus penyakit kulit'),
                          content: Text(
                            'Anda yakin akan menghapus penyakit kulit ${controller.allAlternatif[index].name} [${controller.allAlternatif[index].code}] ?',
                          ),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                              onPressed: () {
                                controller.deleteAlternatif(
                                  controller.allAlternatif[index].id,
                                );
                                Navigator.of(context).pop();
                              },
                              child: const Text('Hapus'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
