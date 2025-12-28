import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../../application/providers/auth_provider.dart';

class AppSidebar extends ConsumerWidget {
  final String currentRoute;

  const AppSidebar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    
    // Menü içeriklerini .NET ile eşleştir
    final employeeMenu = [
      {'icon': Icons.dashboard_outlined, 'activeIcon': Icons.dashboard, 'label': 'Dashboard', 'route': '/home'},
      {'icon': Icons.event_note_outlined, 'activeIcon': Icons.event_note, 'label': 'Rezervasyonlar', 'route': '/reservations'},
      {'icon': Icons.qr_code_scanner_outlined, 'activeIcon': Icons.qr_code_scanner, 'label': 'QR Kod', 'route': '/qr'},
      {'icon': Icons.business_outlined, 'activeIcon': Icons.business, 'label': 'Konumlar', 'route': '/locations'},
      {'icon': Icons.notifications_outlined, 'activeIcon': Icons.notifications, 'label': 'Bildirimler', 'route': '/notifications'},
      {'icon': Icons.bar_chart_outlined, 'activeIcon': Icons.bar_chart, 'label': 'Raporlar', 'route': '/reports'},
      {'icon': Icons.book_outlined, 'activeIcon': Icons.book, 'label': 'Destek', 'route': '/support'},
      {'icon': Icons.settings_outlined, 'activeIcon': Icons.settings, 'label': 'Ayarlar', 'route': '/settings'},
    ];

    final managerMenu = [
  {'icon': Icons.dashboard_outlined, 'activeIcon': Icons.dashboard, 'label': 'Dashboard', 'route': '/home'},
  {'icon': Icons.people_outline, 'activeIcon': Icons.people, 'label': 'Kullanıcılar', 'route': '/manager-users'},
  {'icon': Icons.event_note_outlined, 'activeIcon': Icons.event_note, 'label': 'Rezervasyonlar', 'route': '/reservations'},
  {'icon': Icons.bar_chart_outlined, 'activeIcon': Icons.bar_chart, 'label': 'Raporlar', 'route': '/manager-reports'},
  {'icon': Icons.notifications_outlined, 'activeIcon': Icons.notifications, 'label': 'Bildirimler', 'route': '/manager-notifications'},
  {'icon': Icons.history_outlined, 'activeIcon': Icons.history, 'label': 'Loglar', 'route': '/manager-logs'},
  {'icon': Icons.qr_code_scanner_outlined, 'activeIcon': Icons.qr_code_scanner, 'label': 'QR Kod', 'route': '/qr'},
    ];

    final adminMenu = [
  {'icon': Icons.dashboard_outlined, 'activeIcon': Icons.dashboard, 'label': 'Genel Bakış', 'route': '/overview'},
  {'icon': Icons.business_outlined, 'activeIcon': Icons.business, 'label': 'Konumlar', 'route': '/locations'},
  {'icon': Icons.shield_outlined, 'activeIcon': Icons.shield, 'label': 'Kat Planı', 'route': '/floorplan'},
  {'icon': Icons.book_outlined, 'activeIcon': Icons.book, 'label': 'Kurallar', 'route': '/rules'},
  {'icon': Icons.notifications_outlined, 'activeIcon': Icons.notifications, 'label': 'Bildirimler', 'route': '/admin-notifications'},
  {'icon': Icons.check_box_outlined, 'activeIcon': Icons.check_box, 'label': 'Onaylar', 'route': '/approval'},
  {'icon': Icons.history_outlined, 'activeIcon': Icons.history, 'label': 'Loglar', 'route': '/logs'},
  {'icon': Icons.backup_outlined, 'activeIcon': Icons.backup, 'label': 'Yedekleme', 'route': '/backup'},
  {'icon': Icons.people_outline, 'activeIcon': Icons.people, 'label': 'Kullanıcılar', 'route': '/users'},
  {'icon': Icons.qr_code_scanner_outlined, 'activeIcon': Icons.qr_code_scanner, 'label': 'QR Kod', 'route': '/qr'},
    ];

    List<Map<String, dynamic>> menuItems;
    if (user?.isAdmin == true) {
      menuItems = adminMenu;
    } else if (user?.isManager == true) {
      menuItems = managerMenu;
    } else {
      menuItems = employeeMenu;
    }

    return Container(
      width: 260,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.primaryIndigo.withOpacity(0.05),
            AppTheme.accentIndigo.withOpacity(0.03),
          ],
        ),
        border: Border(
          right: BorderSide(color: AppTheme.surfaceBorder, width: 1),
        ),
      ),
      child: Column(
        children: [
          // Logo Section
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppTheme.primaryIndigo, AppTheme.accentIndigo],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.business, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),
                Text(
                  'Ofis Yönetim',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                for (final item in menuItems)
                  _buildNavItem(
                    context,
                    icon: item['icon'],
                    activeIcon: item['activeIcon'],
                    label: item['label'],
                    route: item['route'],
                  ),
              ],
            ),
          ),
          
          // User Section
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(16),
            decoration: AppTheme.glassCard(),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppTheme.primaryIndigo,
                  child: Text(
                    user?.firstName.substring(0, 1).toUpperCase() ?? 'U',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user?.fullName ?? 'Kullanıcı',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        user?.roleDisplayName ?? 'Çalışan',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required String route,
  }) {
    final isActive = currentRoute == route;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            if (!isActive) {
              context.go(route);
            }
          },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: isActive
                  ? LinearGradient(
                      colors: [
                        AppTheme.primaryIndigo.withOpacity(0.1),
                        AppTheme.accentIndigo.withOpacity(0.1),
                      ],
                    )
                  : null,
              borderRadius: BorderRadius.circular(12),
              border: isActive
                  ? Border.all(color: AppTheme.primaryIndigo.withOpacity(0.2))
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  isActive ? activeIcon : icon,
                  color: isActive ? AppTheme.primaryIndigo : AppTheme.textSecondary,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                      color: isActive ? AppTheme.primaryIndigo : AppTheme.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
