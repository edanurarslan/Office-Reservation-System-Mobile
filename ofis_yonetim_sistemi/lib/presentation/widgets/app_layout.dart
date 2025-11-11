import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_theme.dart';
import 'app_sidebar.dart';

class AppLayout extends StatelessWidget {
  final String currentRoute;
  final String title;
  final Widget child;

  const AppLayout({
    super.key,
    required this.currentRoute,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          AppSidebar(currentRoute: currentRoute),
          
          // Main Content
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF8FAFC), Color(0xFFEEF2FF)],
                ),
              ),
              child: Column(
                children: [
                  // Top Navbar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      border: Border(
                        bottom: BorderSide(color: AppTheme.surfaceBorder, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        // Notifications
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined),
                          onPressed: () {},
                          tooltip: 'Bildirimler',
                        ),
                        const SizedBox(width: 8),
                        // User Menu
                        PopupMenuButton<String>(
                          child: CircleAvatar(
                            backgroundColor: AppTheme.primaryIndigo,
                            child: Text(
                              'U',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          itemBuilder: (context) => <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'profile',
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                title: Text('Profil', style: GoogleFonts.inter()),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'settings',
                              child: ListTile(
                                leading: const Icon(Icons.settings),
                                title: Text('Ayarlar', style: GoogleFonts.inter()),
                              ),
                            ),
                            const PopupMenuDivider(),
                            PopupMenuItem<String>(
                              value: 'logout',
                              child: ListTile(
                                leading: const Icon(Icons.logout),
                                title: Text('Çıkış Yap', style: GoogleFonts.inter()),
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            switch (value) {
                              case 'settings':
                                Navigator.pushReplacementNamed(context, '/settings');
                                break;
                              case 'logout':
                                Navigator.pushReplacementNamed(context, '/login');
                                break;
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  
                  // Content
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
