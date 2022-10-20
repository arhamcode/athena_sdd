import 'package:auto_route/auto_route.dart';

import '../features/alternatif/views/alternatif_page.dart';
import '../features/authentication/views/login_page.dart';
import '../features/authentication/views/register_page.dart';
import '../features/checkup/views/checkup_page.dart';
import '../features/dashboard/dashboard.dart';
import '../features/kriteria/views/kriteria_page.dart';
import '../features/kriteria_alternatif/views/kriteria_alternatif_page.dart';
import '../features/splash_screen/splash_screen.dart';
import '../features/user_management/views/user_management_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: LoginPage, path: '/login'),
    AutoRoute(page: RegisterPage, path: '/register'),
    AutoRoute(page: Dashboard, path: '/dashboard'),
    AutoRoute(page: CheckUpPage, path: '/checkup'),
    AutoRoute(page: KriteriaPage, path: '/kriteria'),
    AutoRoute(page: AlternatifPage, path: '/alternatif'),
    AutoRoute(page: KriteriaAlternatifPage, path: '/kriteriaalternatif'),
    AutoRoute(page: UserManagementPage, path: '/usermanagement'),
  ],
)
// extend the generated private router
class $AppRouter {}
