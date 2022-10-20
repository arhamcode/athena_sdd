import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/user_management_controller.dart';

final DateFormat dateFormat = DateFormat('d MMMM y');

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data User'),
      ),
      body: ChangeNotifierProvider<UserManagementController>(
        create: (context) => UserManagementController(),
        child: Consumer<UserManagementController>(
          builder: (context, controller, child) => controller.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.apiFailed
                  ? Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.fetchUser();
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Muat ulang'),
                      ),
                    )
                  : ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(controller.allUser[index].name),
                        subtitle: Text(
                          'Username : ${controller.allUser[index].username}\nTanggal registrasi : ${dateFormat.format(controller.allUser[index].registerDate.toLocal())}',
                        ),
                      ),
                      itemCount: controller.allUser.length,
                      separatorBuilder: (context, index) => const Divider(),
                    ),
        ),
      ),
    );
  }
}
