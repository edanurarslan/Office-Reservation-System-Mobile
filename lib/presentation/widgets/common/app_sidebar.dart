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
                // Common items for all users
                _buildNavItem(
                  context,
                  icon: Icons.dashboard_outlined,
                  activeIcon: Icons.dashboard,
                  label: 'Dashboard',
                  route: '/home',
                ),
                _buildNavItem(
                  context,
                  icon: Icons.event_note_outlined,
                  activeIcon: Icons.event_note,
                  label: 'Rezervasyonlar',
                  route: '/reservations',
                ),
                _buildNavItem(
                  context,
                  icon: Icons.qr_code_scanner_outlined,
                  activeIcon: Icons.qr_code_scanner,
                  label: 'QR Kod',
                  route: '/qr',
                ),
                
                // Manager and Admin only
                if (user?.canManageResources == true) ...[
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildNavItem(
                    context,
                    icon: Icons.meeting_room_outlined,
                    activeIcon: Icons.meeting_room,
                    label: 'Odalar',
                    route: '/rooms',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.inventory_2_outlined,
                    activeIcon: Icons.inventory_2,
                    label: 'Kaynaklar',
                    route: '/resources',
                  ),
                ],
                
                // Manager and Admin only
                if (user?.canViewReports == true) ...[
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 8),
                  _buildNavItem(
                    context,
                    icon: Icons.dashboard_outlined,
                    activeIcon: Icons.dashboard,
                    label: 'Genel Bakış',
                    route: '/overview',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.analytics_outlined,
                    activeIcon: Icons.analytics,
                    label: 'Raporlar',
                    route: '/reports',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.business_outlined,
                    activeIcon: Icons.business,
                    label: 'Lokasyonlar',
                    route: '/locations',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.map_outlined,
                    activeIcon: Icons.map,
                    label: 'Kat Planı',
                    route: '/floorplan',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.notifications_outlined,
                    activeIcon: Icons.notifications,
                    label: 'Bildirimler',
                    route: '/notifications',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.approval_outlined,
                    activeIcon: Icons.approval,
                    label: 'Onay Bekleyenler',
                    route: '/approval',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.gavel_outlined,
                    activeIcon: Icons.gavel,
                    label: 'Kurallar',
                    route: '/rules',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.history_outlined,
                    activeIcon: Icons.history,
                    label: 'İşlem Geçmişi',
                    route: '/logs',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.backup_outlined,
                    activeIcon: Icons.backup,
                    label: 'Yedekleme',
                    route: '/backup',
                  ),
                  
                  // Manager-specific pages
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      'MANAGER TOOLS',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textTertiary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.history_edu_outlined,
                    activeIcon: Icons.history_edu,
                    label: 'Manager Logları',
                    route: '/manager-logs',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.campaign_outlined,
                    activeIcon: Icons.campaign,
                    label: 'Manager Bildirimleri',
                    route: '/manager-notifications',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.assessment_outlined,
                    activeIcon: Icons.assessment,
                    label: 'Manager Raporları',
                    route: '/manager-reports',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.people_alt_outlined,
                    activeIcon: Icons.people_alt,
                    label: 'Manager Kullanıcıları',
                    route: '/manager-users',
                  ),
                ],
                
                // Admin only
                if (user?.canManageUsers == true) ...[
                  _buildNavItem(
                    context,
                    icon: Icons.people_outline,
                    activeIcon: Icons.people,
                    label: 'Kullanıcılar',
                    route: '/users',
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.person_add_outlined,
                    activeIcon: Icons.person_add,
                    label: 'Kayıt',
                    route: '/register',
                  ),
                ],
                
                // All users
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                _buildNavItem(
                  context,
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                  label: 'Ayarlar',
                  route: '/settings',
                ),
                
                // Developer Tools (Admin only)
                if (user?.isAdmin == true) ...[
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      'DEVELOPER',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textTertiary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  _buildNavItem(
                    context,
                    icon: Icons.bug_report_outlined,
                    activeIcon: Icons.bug_report,
                    label: 'API Test',
                    route: '/api-test',
                  ),
                ],
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
