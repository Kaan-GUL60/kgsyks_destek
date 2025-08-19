import 'package:go_router/go_router.dart';
import 'package:kgsyks_destek/pages/ana_ekran/ana_ekran.dart';
import 'package:kgsyks_destek/pages/giris/login.dart';
import 'package:kgsyks_destek/pages/giris/signin.dart';

// Route names as enum
enum AppRoute { home, login, signin, anaekran, profile, settings }

// Route paths as extension
extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.login:
        return '/login';
      case AppRoute.signin:
        return '/signin';
      case AppRoute.anaekran:
        return '/anaekran';
      case AppRoute.profile:
        return '/profile';
      case AppRoute.settings:
        return '/settings';
    }
  }
}

// GoRouter configuration
final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => LogInView(),
    ),
    GoRoute(
      path: AppRoute.signin.path,
      name: AppRoute.signin.name,
      builder: (context, state) => SignIn(),
    ),
    GoRoute(
      path: AppRoute.anaekran.path,
      name: AppRoute.anaekran.name,
      builder: (context, state) => AnaEkran(),
    ),
  ],
);
