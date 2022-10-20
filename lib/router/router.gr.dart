// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../features/alternatif/models/alternatif.dart' as _i12;
import '../features/alternatif/views/alternatif_page.dart' as _i7;
import '../features/authentication/views/login_page.dart' as _i2;
import '../features/authentication/views/register_page.dart' as _i3;
import '../features/checkup/views/checkup_page.dart' as _i5;
import '../features/dashboard/dashboard.dart' as _i4;
import '../features/kriteria/views/kriteria_page.dart' as _i6;
import '../features/kriteria_alternatif/views/kriteria_alternatif_page.dart'
    as _i8;
import '../features/splash_screen/splash_screen.dart' as _i1;
import '../features/user_management/views/user_management_page.dart' as _i9;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(key: args.key),
      );
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.RegisterPage(key: args.key),
      );
    },
    Dashboard.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.Dashboard(),
      );
    },
    CheckUpRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CheckUpPage(),
      );
    },
    KriteriaRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.KriteriaPage(),
      );
    },
    AlternatifRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AlternatifPage(),
      );
    },
    KriteriaAlternatifRoute.name: (routeData) {
      final args = routeData.argsAs<KriteriaAlternatifRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.KriteriaAlternatifPage(
          key: args.key,
          alternatif: args.alternatif,
        ),
      );
    },
    UserManagementRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.UserManagementPage(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i10.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        _i10.RouteConfig(
          RegisterRoute.name,
          path: '/register',
        ),
        _i10.RouteConfig(
          Dashboard.name,
          path: '/dashboard',
        ),
        _i10.RouteConfig(
          CheckUpRoute.name,
          path: '/checkup',
        ),
        _i10.RouteConfig(
          KriteriaRoute.name,
          path: '/kriteria',
        ),
        _i10.RouteConfig(
          AlternatifRoute.name,
          path: '/alternatif',
        ),
        _i10.RouteConfig(
          KriteriaAlternatifRoute.name,
          path: '/kriteriaalternatif',
        ),
        _i10.RouteConfig(
          UserManagementRoute.name,
          path: '/usermanagement',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i10.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i11.Key? key})
      : super(
          LoginRoute.name,
          path: '/login',
          args: LoginRouteArgs(key: key),
        );

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i10.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i11.Key? key})
      : super(
          RegisterRoute.name,
          path: '/register',
          args: RegisterRouteArgs(key: key),
        );

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.Dashboard]
class Dashboard extends _i10.PageRouteInfo<void> {
  const Dashboard()
      : super(
          Dashboard.name,
          path: '/dashboard',
        );

  static const String name = 'Dashboard';
}

/// generated route for
/// [_i5.CheckUpPage]
class CheckUpRoute extends _i10.PageRouteInfo<void> {
  const CheckUpRoute()
      : super(
          CheckUpRoute.name,
          path: '/checkup',
        );

  static const String name = 'CheckUpRoute';
}

/// generated route for
/// [_i6.KriteriaPage]
class KriteriaRoute extends _i10.PageRouteInfo<void> {
  const KriteriaRoute()
      : super(
          KriteriaRoute.name,
          path: '/kriteria',
        );

  static const String name = 'KriteriaRoute';
}

/// generated route for
/// [_i7.AlternatifPage]
class AlternatifRoute extends _i10.PageRouteInfo<void> {
  const AlternatifRoute()
      : super(
          AlternatifRoute.name,
          path: '/alternatif',
        );

  static const String name = 'AlternatifRoute';
}

/// generated route for
/// [_i8.KriteriaAlternatifPage]
class KriteriaAlternatifRoute
    extends _i10.PageRouteInfo<KriteriaAlternatifRouteArgs> {
  KriteriaAlternatifRoute({
    _i11.Key? key,
    required _i12.Alternatif alternatif,
  }) : super(
          KriteriaAlternatifRoute.name,
          path: '/kriteriaalternatif',
          args: KriteriaAlternatifRouteArgs(
            key: key,
            alternatif: alternatif,
          ),
        );

  static const String name = 'KriteriaAlternatifRoute';
}

class KriteriaAlternatifRouteArgs {
  const KriteriaAlternatifRouteArgs({
    this.key,
    required this.alternatif,
  });

  final _i11.Key? key;

  final _i12.Alternatif alternatif;

  @override
  String toString() {
    return 'KriteriaAlternatifRouteArgs{key: $key, alternatif: $alternatif}';
  }
}

/// generated route for
/// [_i9.UserManagementPage]
class UserManagementRoute extends _i10.PageRouteInfo<void> {
  const UserManagementRoute()
      : super(
          UserManagementRoute.name,
          path: '/usermanagement',
        );

  static const String name = 'UserManagementRoute';
}
