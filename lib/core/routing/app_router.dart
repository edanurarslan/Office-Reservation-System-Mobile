import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofis_yonetim_sistemi/presentation/widgets/dashboards/admin_dashboard.dart';
import '../../application/providers/auth_provider.dart';
import '../../presentation/pages/auth/auth.dart';
import '../../presentation/pages/employee/employee.dart';
import '../../presentation/pages/admin/admin.dart';
import '../../presentation/pages/manager/manager.dart';
import '../../presentation/pages/resources_page.dart';
import '../../presentation/pages/rooms_page.dart';
import '../../presentation/pages/common/common.dart';
import '../../presentation/widgets/common/common.dart';
import 'route_guard.dart';

// Route paths
class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';
  static const String reservations = '/reservations';
  static const String qr = '/qr';
  static const String settings = '/settings';
  static const String admin = '/admin';
  static const String users = '/users';
  static const String reports = '/reports';
  static const String locations = '/locations';
  static const String notifications = '/notifications';
  static const String approval = '/approval';
  static const String rules = '/rules';
  static const String logs = '/logs';
  static const String overview = '/overview';
  static const String register = '/register';
  static const String backup = '/backup';
  static const String floorplan = '/floorplan';
  static const String managerLogs = '/manager-logs';
  static const String managerNotifications = '/manager-notifications';
  static const String managerReports = '/manager-reports';
  static const String managerUsers = '/manager-users';
  static const String resources = '/resources';
  static const String rooms = '/rooms';
  static const String apiTest = '/api-test';
  static const String adminNotifications = '/admin-notifications';
  static const String adminDashboard = '/admin-dashboard';
}

// Router provider with authentication and role-based guards
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  
  return GoRouter(
    initialLocation: AppRoutes.splash,
    debugLogDiagnostics: true,
    
    // Redirect logic for authentication and permissions
    redirect: (context, state) {
      final user = authState.user;
      final isLoggedIn = user != null;
      final path = state.matchedLocation;
      
      // Allow splash and login without authentication
      if (path == AppRoutes.splash || path == AppRoutes.login) {
        return null;
      }
      
      // Redirect to login if not authenticated
      if (!isLoggedIn) {
        return AppRoutes.login;
      }
      
      // Check route permissions
      final redirectPath = RouteGuard.getRedirectPath(path, user);
      return redirectPath;
    },
    
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.adminDashboard,
        name: 'admin-dashboard',
        builder: (context, state) => const AppLayout(
          currentRoute: '/admin-dashboard',
          child: AdminDashboard(),
        ),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const AppLayout(
          currentRoute: '/home',
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.reservations,
        name: 'reservations',
        builder: (context, state) => const AppLayout(
          currentRoute: '/reservations',
          child: ReservationsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.qr,
        name: 'qr',
        builder: (context, state) => const AppLayout(
          currentRoute: '/qr',
          child: QrPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: 'settings',
        builder: (context, state) => const AppLayout(
          currentRoute: '/settings',
          child: SettingsPage(),
        ),
      ),
      // Admin-only routes
      GoRoute(
        path: AppRoutes.admin,
        name: 'admin',
        builder: (context, state) => const MainNavigationWrapper(initialIndex: 4),
      ),
      GoRoute(
        path: AppRoutes.users,
        name: 'users',
        builder: (context, state) => const AppLayout(
          currentRoute: '/users',
          child: UsersPage(),
        ),
      ),
      // Employee routes
      GoRoute(
        path: '/locations',
        name: 'locations',
        builder: (context, state) => const AppLayout(
          currentRoute: '/locations',
          child: LocationsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        name: 'notifications',
        builder: (context, state) => const AppLayout(
          currentRoute: '/notifications',
          child: NotificationsPage(),
        ),
      ),
      GoRoute(
        path: '/support',
        name: 'support',
        builder: (context, state) => const AppLayout(
          currentRoute: '/support',
          child: SupportPage(),
        ),
      ),
      // Manager routes
      GoRoute(
        path: AppRoutes.approval,
        name: 'approval',
        builder: (context, state) => const AppLayout(
          currentRoute: '/approval',
          child: ApprovalPage(),
        ),
      ),
      GoRoute(
        path: '/manager-logs',
        name: 'manager-logs',
        builder: (context, state) => const AppLayout(
          currentRoute: '/manager-logs',
          child: ManagerLogsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.managerNotifications,
        name: 'manager-notifications',
        builder: (context, state) => const AppLayout(
          currentRoute: '/manager-notifications',
          child: ManagerNotificationsPage(),
        ),
      ),
      GoRoute(
        path: '/admin-notifications',
        name: 'admin-notifications',
        builder: (context, state) => const AppLayout(
          currentRoute: '/admin-notifications',
          child: AdminNotificationsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.managerReports,
        name: 'manager-reports',
        builder: (context, state) => const AppLayout(
          currentRoute: '/manager-reports',
          child: ManagerReportsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.managerUsers,
        name: 'manager-users',
        builder: (context, state) => const AppLayout(
          currentRoute: '/manager-users',
          child: ManagerUsersPage(),
        ),
      ),
      // Admin routes
      GoRoute(
        path: AppRoutes.reports,
        name: 'reports',
        builder: (context, state) => const AppLayout(
          currentRoute: '/reports',
          child: ReportsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.logs,
        name: 'logs',
        builder: (context, state) => const AppLayout(
          currentRoute: '/logs',
          child: LogsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.overview,
        name: 'overview',
        builder: (context, state) => const AppLayout(
          currentRoute: '/overview',
          child: OverviewPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.backup,
        name: 'backup',
        builder: (context, state) => const AppLayout(
          currentRoute: '/backup',
          child: BackupPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.rules,
        name: 'rules',
        builder: (context, state) => const AppLayout(
          currentRoute: '/rules',
          child: RulesPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.floorplan,
        name: 'floorplan',
        builder: (context, state) => const AppLayout(
          currentRoute: '/floorplan',
          child: FloorplanPage(),
        ),
      ),
      // Resources and Rooms routes
      GoRoute(
        path: AppRoutes.resources,
        name: 'resources',
        builder: (context, state) => const AppLayout(
          currentRoute: '/resources',
          child: ResourcesPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.rooms,
        name: 'rooms',
        builder: (context, state) => const AppLayout(
          currentRoute: '/rooms',
          child: RoomsPage(),
        ),
      ),
      // Developer tools (Admin only)
      GoRoute(
        path: AppRoutes.apiTest,
        name: 'api-test',
        builder: (context, state) => const AppLayout(
          currentRoute: '/api-test',
          child: ApiTestPage(),
        ),
      ),
    ],
  );
});