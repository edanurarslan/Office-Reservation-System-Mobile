import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/providers/auth_provider.dart';
import '../../../core/routing/route_guard.dart';
import '../../pages/common/common.dart';

/// Widget that wraps pages requiring specific permissions
class PermissionGuardWidget extends ConsumerWidget {
  final Widget child;
  final String requiredRoute;
  final bool showUnauthorizedPage;

  const PermissionGuardWidget({
    super.key,
    required this.child,
    required this.requiredRoute,
    this.showUnauthorizedPage = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).user;

    // Check if user has permission
    if (RouteGuard.canAccess(requiredRoute, user)) {
      return child;
    }

    // Show unauthorized page or empty container
    if (showUnauthorizedPage) {
      return UnauthorizedPage(attemptedRoute: requiredRoute);
    }

    return const SizedBox.shrink();
  }
}

/// Mixin for pages that need permission checking
mixin PermissionCheckMixin {
  /// Check if current user has permission for a route
  bool hasPermission(WidgetRef ref, String route) {
    final user = ref.read(authProvider).user;
    return RouteGuard.canAccess(route, user);
  }

  /// Show unauthorized snackbar
  void showUnauthorizedSnackbar(BuildContext context, String route, WidgetRef ref) {
    final user = ref.read(authProvider).user;
    final message = RouteGuard.getUnauthorizedMessage(route, user);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.lock_outline, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
