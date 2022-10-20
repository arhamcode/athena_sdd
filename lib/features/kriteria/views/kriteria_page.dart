import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/kriteria_controller.dart';
import 'add_kriteria_page.dart';

class KriteriaPage extends StatelessWidget {
  const KriteriaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KriteriaController>(
      create: (context) => KriteriaController(),
      child: Consumer<KriteriaController>(
        builder: (context, controller, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Kriteria'),
            actions: [
              IconButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddKriteriaPage(),
                  ));
                  controller.fetchKriteria();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: ListView.separated(
            itemCount: controller.allKriteria.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ListTile(
              title: Text(controller.allKriteria[index].name),
              subtitle: Text(
                'Kode ${controller.allKriteria[index].code} - Nilai ${controller.allKriteria[index].belief}',
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // IconButton(
                  //   color: Colors.green,
                  //   onPressed: () {},
                  //   icon: const Icon(Icons.edit),
                  // ),
                  IconButton(
                    color: Colors.red,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Hapus gejala'),
                          content: Text(
                            'Anda yakin akan menghapus gejala ${controller.allKriteria[index].name} [${controller.allKriteria[index].code}] ?',
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
                                controller.deleteKriteria(
                                  controller.allKriteria[index].id,
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
