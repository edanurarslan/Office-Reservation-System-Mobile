import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';

/// Route guard that checks if user has required permissions
class RouteGuard {
  /// Check if user can access a route
  static bool canAccess(String route, User? user) {
    if (user == null) return false;

    switch (route) {
      // Routes accessible to all authenticated users
      case '/home':
      case '/reservations':
      case '/qr':
      case '/settings':
      case '/locations':
      case '/notifications':
      case '/reports':
        return true;

      // Manager and Admin only
      case '/approval':
      case '/rules':
      case '/logs':
      case '/overview':
      case '/backup':
      case '/floorplan':
      case '/manager-logs':
      case '/manager-notifications':
      case '/manager-reports':
      case '/manager-users':
      case '/resources':
      case '/rooms':
        return user.canViewReports || user.canManageResources;

      // Admin only
      case '/users':
      case '/admin':
      case '/register':
      case '/api-test':
        return user.canManageUsers;

      default:
        return true; // Allow unknown routes by default (will be caught by 404)
    }
  }

  /// Get redirect path if user cannot access requested route
  static String? getRedirectPath(String requestedRoute, User? user) {
    if (user == null) {
      return '/login';
    }

    if (!canAccess(requestedRoute, user)) {
      // Redirect to home if user doesn't have permission
      return '/home';
    }

    return null; // No redirect needed
  }

  /// Get user-friendly error message for unauthorized access
  static String getUnauthorizedMessage(String route, User? user) {
    if (user == null) {
      return 'Bu sayfaya erişmek için giriş yapmalısınız.';
    }

    switch (route) {
      case '/users':
      case '/admin':
        return 'Bu sayfaya yalnızca yöneticiler erişebilir.';
      case '/reports':
      case '/resources':
      case '/rooms':
        return 'Bu sayfaya erişim için yönetici veya müdür yetkisi gereklidir.';
      default:
        return 'Bu sayfaya erişim yetkiniz bulunmamaktadır.';
    }
  }

  /// Show unauthorized access dialog
  static void showUnauthorizedDialog(BuildContext context, String route, User? user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erişim Engellendi'),
        content: Text(getUnauthorizedMessage(route, user)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }
}
