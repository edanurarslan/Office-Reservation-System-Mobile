import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/reservations_page.dart';
import '../pages/qr_page.dart';
import '../pages/settings_page.dart';
import '../pages/admin_page.dart';
import '../pages/users_page.dart';
import '../pages/reports_page.dart';
import '../pages/locations_page.dart';
import '../pages/notifications_page.dart';
import '../pages/approval_page.dart';
import '../pages/rules_page.dart';
import '../pages/logs_page.dart';
import '../pages/overview_page.dart';
import '../pages/register_page.dart';
import '../pages/backup_page.dart';
import '../pages/floorplan_page.dart';
import '../pages/manager_logs_page.dart';
import '../pages/manager_notifications_page.dart';
import '../pages/manager_reports_page.dart';
import '../pages/manager_users_page.dart';
import '../pages/api_test_page.dart';

class MainNavigationWrapper extends StatefulWidget {
  final int initialIndex;
  
  const MainNavigationWrapper({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _pages = [
    const HomePage(),                    // 0: /home
    const ReservationsPage(),            // 1: /reservations
    const QrPage(),                      // 2: /qr
    const SettingsPage(),                // 3: /settings
    const AdminPage(),                   // 4: /admin
    const UsersPage(),                   // 5: /users
    const ReportsPage(),                 // 6: /reports
    const LocationsPage(),               // 7: /locations
    const NotificationsPage(),           // 8: /notifications
    const ApprovalPage(),                // 9: /approval
    const RulesPage(),                   // 10: /rules
    const LogsPage(),                    // 11: /logs
    const OverviewPage(),                // 12: /overview
    const RegisterPage(),                // 13: /register
    const BackupPage(),                  // 14: /backup
    const FloorplanPage(),               // 15: /floorplan
    const ManagerLogsPage(),             // 16: /manager-logs
    const ManagerNotificationsPage(),    // 17: /manager-notifications
    const ManagerReportsPage(),          // 18: /manager-reports
    const ManagerUsersPage(),            // 19: /manager-users
    const HomePage(),                    // 20: /resources (placeholder)
    const HomePage(),                    // 21: /rooms (placeholder)
    const ApiTestPage(),                 // 22: /api-test
  ];

  @override
  Widget build(BuildContext context) {
    // Only show pages within valid range
    if (_currentIndex >= _pages.length) {
      _currentIndex = 0;
    }
    
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: null, // Remove bottom nav as we're using sidebar
    );
  }
}