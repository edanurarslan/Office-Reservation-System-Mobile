import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/pages/login_page.dart';
import '../../presentation/pages/splash_page.dart';
import '../../presentation/widgets/main_navigation_wrapper.dart';

// Route paths
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String reservations = '/reservations';
  static const String qr = '/qr';
  static const String settings = '/settings';
  static const String admin = '/admin';
}

// Router provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const MainNavigationWrapper(),
      ),
      GoRoute(
        path: AppRoutes.reservations,
        name: 'reservations',
        builder: (context, state) => const MainNavigationWrapper(initialIndex: 1),
      ),
      GoRoute(
        path: AppRoutes.qr,
        name: 'qr',
        builder: (context, state) => const MainNavigationWrapper(initialIndex: 2),
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: 'settings',
        builder: (context, state) => const MainNavigationWrapper(initialIndex: 3),
      ),
      GoRoute(
        path: AppRoutes.admin,
        name: 'admin',
        builder: (context, state) => const MainNavigationWrapper(initialIndex: 4),
      ),
    ],
  );
});