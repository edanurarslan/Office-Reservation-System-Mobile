import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import 'app_sidebar.dart';

class AppLayout extends StatefulWidget {
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
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  bool sidebarOpen = true;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Küçük ekranda sidebar kapalı başlasın
    if (screenWidth < 900 && sidebarOpen) sidebarOpen = false;
    return Scaffold(
      body: Stack(
        children: [
          // Sidebar (açık ise göster)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 250),
            left: sidebarOpen ? 0 : -260,
            top: 0,
            bottom: 0,
            width: 260,
            child: AppSidebar(currentRoute: widget.currentRoute),
          ),
          // Main Content
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.ease,
            margin: EdgeInsets.only(left: sidebarOpen ? 260 : 0),
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
                      // Hamburger butonu (her zaman görünür)
                      IconButton(
                        icon: Icon(sidebarOpen ? Icons.menu_open : Icons.menu),
                        onPressed: () {
                          setState(() {
                            sidebarOpen = !sidebarOpen;
                          });
                        },
                        tooltip: sidebarOpen ? 'Menüyü Kapat' : 'Menüyü Aç',
                      ),
                      Text(
                        widget.title,
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
                Expanded(child: widget.child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
