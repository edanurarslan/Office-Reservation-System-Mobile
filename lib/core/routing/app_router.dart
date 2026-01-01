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
          title: 'Admin Dashboard',
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
      // Admin-only routes
      GoRoute(
        path: AppRoutes.admin,
        name: 'admin',
        builder: (context, state) => const MainNavigationWrapper(initialIndex: 4),
      ),
      GoRoute(
        path: AppRoutes.users,
        name: 'users',
        builder: (context, state) => const UsersPage(),
      ),
      // Employee routes
      GoRoute(
        path: '/locations',
        name: 'locations',
        builder: (context, state) => const LocationsPage(),
      ),
      GoRoute(
        path: AppRoutes.notifications,
        name: 'notifications',
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: '/support',
        name: 'support',
        builder: (context, state) => const SupportPage(),
      ),
      // Manager routes
      GoRoute(
        path: AppRoutes.approval,
        name: 'approval',
        builder: (context, state) => const ApprovalPage(),
      ),
      GoRoute(
        path: '/manager-logs',
        name: 'manager-logs',
        builder: (context, state) => const ManagerLogsPage(),
      ),
      GoRoute(
        path: AppRoutes.managerNotifications,
        name: 'manager-notifications',
        builder: (context, state) => const ManagerNotificationsPage(),
      ),
      GoRoute(
        path: '/admin-notifications',
        name: 'admin-notifications',
        builder: (context, state) => const AdminNotificationsPage(),
      ),
      GoRoute(
        path: AppRoutes.managerReports,
        name: 'manager-reports',
        builder: (context, state) => const ManagerReportsPage(),
      ),
      GoRoute(
        path: AppRoutes.managerUsers,
        name: 'manager-users',
        builder: (context, state) => const ManagerUsersPage(),
      ),
      // Admin routes
      GoRoute(
        path: AppRoutes.reports,
        name: 'reports',
        builder: (context, state) => const ReportsPage(),
      ),
      GoRoute(
        path: AppRoutes.logs,
        name: 'logs',
        builder: (context, state) => const LogsPage(),
      ),
      GoRoute(
        path: AppRoutes.overview,
        name: 'overview',
        builder: (context, state) => const OverviewPage(),
      ),
      GoRoute(
        path: AppRoutes.backup,
        name: 'backup',
        builder: (context, state) => const BackupPage(),
      ),
      GoRoute(
        path: AppRoutes.rules,
        name: 'rules',
        builder: (context, state) => const RulesPage(),
      ),
      GoRoute(
        path: AppRoutes.floorplan,
        name: 'floorplan',
        builder: (context, state) => const FloorplanPage(),
      ),
      // Resources and Rooms routes
      GoRoute(
        path: AppRoutes.resources,
        name: 'resources',
        builder: (context, state) => const ResourcesPage(),
      ),
      GoRoute(
        path: AppRoutes.rooms,
        name: 'rooms',
        builder: (context, state) => const RoomsPage(),
      ),
      // Developer tools (Admin only)
      GoRoute(
        path: AppRoutes.apiTest,
        name: 'api-test',
        builder: (context, state) => const ApiTestPage(),
      ),
    ],
  );
});