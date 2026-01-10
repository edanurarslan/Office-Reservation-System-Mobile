import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../application/providers/auth_provider.dart';
import 'app_sidebar.dart';

class AppLayout extends ConsumerStatefulWidget {
  final String currentRoute;
  final String title;
  final Widget child;
  final bool showHeader;

  const AppLayout({
    super.key,
    required this.currentRoute,
    this.title = '',
    required this.child,
    this.showHeader = false,
  });

  @override
  ConsumerState<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends ConsumerState<AppLayout> {
  bool sidebarOpen = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;
    if (isMobile && sidebarOpen) sidebarOpen = false;
    
    return Scaffold(
      key: _scaffoldKey,
      drawer: isMobile
          ? Drawer(
              child: SafeArea(child: AppSidebar(currentRoute: widget.currentRoute)),
            )
          : null,
      body: Row(
        children: [
          // Desktop sidebar
          if (!isMobile)
            SizedBox(
              width: 260,
              child: AppSidebar(currentRoute: widget.currentRoute),
            ),
          // Main content
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
                  // Mobile top navbar
                  if (isMobile)
                    Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Hamburger menu button
                          IconButton(
                            icon: const Icon(Icons.menu, color: Color(0xFF374151)),
                            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                            tooltip: 'Menü',
                          ),
                          const SizedBox(width: 12),
                          // Logo/Title
                          Text(
                            'Ofis Yönetim',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF1F2937),
                            ),
                          ),
                          const Spacer(),
                          // Notification icon
                          IconButton(
                            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF6B7280)),
                            onPressed: () {},
                            tooltip: 'Bildirimler',
                          ),
                          // Logout button
                          PopupMenuButton<String>(
                            icon: const CircleAvatar(
                              radius: 16,
                              backgroundColor: Color(0xFF4F46E5),
                              child: Icon(Icons.person, size: 18, color: Colors.white),
                            ),
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: 'logout',
                                child: Row(
                                  children: [
                                    Icon(Icons.logout, color: Colors.red, size: 20),
                                    SizedBox(width: 8),
                                    Text('Çıkış Yap'),
                                  ],
                                ),
                              ),
                            ],
                            onSelected: (value) async {
                              if (value == 'logout') {
                                await ref.read(authProvider.notifier).logout();
                                if (context.mounted) {
                                  context.go('/login');
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  // Page content
                  Expanded(child: widget.child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}