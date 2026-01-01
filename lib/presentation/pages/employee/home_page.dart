import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/providers/auth_provider.dart';
import '../../widgets/common/common.dart';
import '../../widgets/dashboards/dashboards.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return AppLayout(
      currentRoute: '/home',
      title: 'Dashboard',
      child: user == null 
          ? const Center(child: CircularProgressIndicator())
          : _buildRoleBasedDashboard(user),
    );
  }

  Widget _buildRoleBasedDashboard(user) {
    // Admin dashboard
    if (user.isAdmin) {
      return const AdminDashboard();
    }
    
    // Manager dashboard
    if (user.isManager) {
      return ManagerDashboard(user: user);
    }
    
    // Employee dashboard (default)
    return EmployeeDashboard(user: user);
  }
}
