import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/authentication/model/auth_user.dart';
import 'features/authentication/model/user_role.dart';
import 'features/authentication/services/authentication_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserRoleAdapter());
  Hive.registerAdapter(AuthUserAdapter());

  Box<AuthUser> authBox = await Hive.openBox('authBox');
  locator.registerSingleton<AuthenticationService>(
    AuthenticationService(authBox: authBox),
  );
}
