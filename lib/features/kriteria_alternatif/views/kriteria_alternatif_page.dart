import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../alternatif/models/alternatif.dart';
import '../controller/kriteria_alternatif_controller.dart';

class KriteriaAlternatifPage extends StatelessWidget {
  final Alternatif alternatif;

  const KriteriaAlternatifPage({super.key, required this.alternatif});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<KriteriaAlternatifController>(
      create: (context) => KriteriaAlternatifController(
        penyakitId: alternatif.id,
      ),
      child: Consumer<KriteriaAlternatifController>(
        builder: (context, controller, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              'Gejala penyakit ${alternatif.name} [${alternatif.code}]',
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  var result = await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        width: 500,
                        height: 300,
                        child: FutureBuilder(
                          future: controller.fetchAvailableGejala(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return ListView(
                                children: snapshot.data!
                                    .map(
                                      (e) => ListTile(
                                        onTap: () {
                                          Navigator.of(context).pop(e);
                                        },
                                        leading: const Icon(Icons.circle),
                                        title: Text(e.name),
                                      ),
                                    )
                                    .toList(),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                    ),
                  );
                  if (result != null) {
                    controller.addGejala(result.id);
                    alternatif.gejala.add(result);
                  }
                },
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(
                '[${alternatif.gejala[index].code}] ${alternatif.gejala[index].name}',
              ),
              subtitle: Text(
                'Nilai ${alternatif.gejala[index].belief}',
              ),
              trailing: IconButton(
                color: Colors.red,
                onPressed: () {
                  controller.deleteGejala(alternatif.gejala[index].id);
                  alternatif.gejala.removeAt(index);
                },
                icon: const Icon(Icons.delete),
              ),
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: alternatif.gejala.length,
          ),
        ),
      ),
    );
  }
}
