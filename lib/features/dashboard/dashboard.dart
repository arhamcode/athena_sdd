import 'package:ath_mobile/features/dashboard/controller/dashboard_controller.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../authentication/model/user_role.dart';
import '../authentication/services/authentication_service.dart';
import 'widgets/drawer.dart';

final DateFormat dateFormat = DateFormat('d MMMM y H:m:s');

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: ChangeNotifierProvider<DashboardController>(
        create: (context) => DashboardController(),
        child: Consumer<DashboardController>(
          builder: (context, controller, child) => controller.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: controller.fetchCheckUp,
                  child: ListView.separated(
                    itemBuilder: (context, index) => ListTile(
                      title: Text(
                        'Hasil: Penyakit ${controller.allCheckUp[index].namaPenyakit} oleh ${controller.allCheckUp[index].userName}',
                      ),
                      subtitle: Text(
                        'Tanggal pengecekan : ${dateFormat.format(controller.allCheckUp[index].checkupDate.toLocal())}',
                      ),
                    ),
                    itemCount: controller.allCheckUp.length,
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                ),
        ),
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
