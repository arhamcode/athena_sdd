import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../authentication/model/auth_user.dart';
import '../../authentication/model/user_role.dart';
import '../../authentication/services/authentication_service.dart';

class AppDrawer extends StatelessWidget {
  final AuthUser authUser = locator<AuthenticationService>().getUser();

  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              tileColor: Colors.blue,
              textColor: Colors.white,
              title: Text(authUser.name),
              subtitle: Text(authUser.userName),
            ),
            authUser.role != UserRole.admin
                ? Container()
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: const Text('Kriteria'),
                        onTap: () {
                          Navigator.of(context).pop();
                          context.router.pushNamed('/kriteria');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.account_box),
                        title: const Text('Alternatif'),
                        onTap: () {
                          Navigator.of(context).pop();
                          context.router.pushNamed('/alternatif');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.people),
                        title: const Text('Data User'),
                        onTap: () {
                          Navigator.of(context).pop();
                          context.router.pushNamed('/usermanagement');
                        },
                      ),
                    ],
                  ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Logout'),
                    content: const Text('Akhiri sesi login?'),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await locator<AuthenticationService>().logout();
                          context.router.replaceNamed('/login');
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
