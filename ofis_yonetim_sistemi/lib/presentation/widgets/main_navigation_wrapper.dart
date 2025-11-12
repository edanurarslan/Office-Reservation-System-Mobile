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

class _MainNavigationWrapperState extends State<MainNavigationWrapper>
    with AutomaticKeepAliveClientMixin {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  void didUpdateWidget(MainNavigationWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialIndex != widget.initialIndex) {
      _currentIndex = widget.initialIndex;
    }
  }

  @override
  bool get wantKeepAlive => true;

  // Build page based on index (lazy loading)
  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const ReservationsPage();
      case 2:
        return const QrPage();
      case 3:
        return const SettingsPage();
      case 4:
        return const AdminPage();
      case 5:
        return const UsersPage();
      case 6:
        return const ReportsPage();
      case 7:
        return const LocationsPage();
      case 8:
        return const NotificationsPage();
      case 9:
        return const ApprovalPage();
      case 10:
        return const RulesPage();
      case 11:
        return const LogsPage();
      case 12:
        return const OverviewPage();
      case 13:
        return const RegisterPage();
      case 14:
        return const BackupPage();
      case 15:
        return const FloorplanPage();
      case 16:
        return const ManagerLogsPage();
      case 17:
        return const ManagerNotificationsPage();
      case 18:
        return const ManagerReportsPage();
      case 19:
        return const ManagerUsersPage();
      case 20:
        return const HomePage(); // /resources placeholder
      case 21:
        return const HomePage(); // /rooms placeholder
      case 22:
        return const ApiTestPage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    // Validate current index
    if (_currentIndex >= 23) {
      _currentIndex = 0;
    }
    
    return Scaffold(
      body: _buildPage(_currentIndex),
      bottomNavigationBar: null, // Remove bottom nav as we're using sidebar
    );
  }
}