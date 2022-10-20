import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../authentication/model/user_role.dart';
import '../authentication/services/authentication_service.dart';
import 'widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Belum ada riwayat pengecekan'),
          ),
        ],
      ),
      drawer: AppDrawer(),
      floatingActionButton:
          locator<AuthenticationService>().getUser().role == UserRole.admin
              ? Container()
              : ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    context.router.pushNamed('/checkup');
                  },
                  icon: const Icon(Icons.search),
                  label: const Text('Cek Penyakit Kulit'),
                ),
    );
  }
}
