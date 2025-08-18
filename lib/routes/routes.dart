import 'package:go_router/go_router.dart';
import 'package:kgsyks_destek/pages/giris/login.dart';

// Route names as enum
enum AppRoute { home, login, profile, settings }

// Route paths as extension
extension AppRouteExtension on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.home:
        return '/';
      case AppRoute.login:
        return '/login';
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
  ],
);
