import 'package:flutter/material.dart';
import '../../pages/employee/employee.dart';
import '../../pages/admin/admin.dart';
import '../../pages/resources_page.dart';
import '../../pages/rooms_page.dart';

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
      case 20:
        return const ResourcesPage();
      case 21:
        return const RoomsPage();
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