import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';
import '../../../core/theme/app_theme.dart';

class OverviewPage extends ConsumerWidget {
  const OverviewPage({super.key});

  // TextStyle Helpers
  TextStyle _subtitleStyle() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppTheme.textSecondary,
    height: 1.4,
    letterSpacing: 0.3,
  );

  TextStyle _statValueStyle() => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppTheme.textPrimary,
    height: 1.1,
    letterSpacing: -0.5,
  );

  TextStyle _statLabelStyle() => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppTheme.textSecondary,
    height: 1.3,
    letterSpacing: 0.2,
  );

  TextStyle _sectionTitleStyle() => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppTheme.textPrimary,
    height: 1.3,
    letterSpacing: -0.2,
  );

  TextStyle _activityUserStyle() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppTheme.textPrimary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  TextStyle _activityActionStyle() => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppTheme.textSecondary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  TextStyle _activityTimeStyle() => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppTheme.textTertiary,
    height: 1.3,
    letterSpacing: 0.1,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppLayout(
      currentRoute: '/overview',
      title: 'Genel Bakış',
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Responsive Stats Cards
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 4;
              if (constraints.maxWidth < 900) crossAxisCount = 2;
              if (constraints.maxWidth < 600) crossAxisCount = 1;
              final stats = [
                {'title': 'Toplam Rezervasyon', 'value': '247', 'icon': Icons.event, 'color': Colors.blue},
                {'title': 'Aktif Kullanıcı', 'value': '42', 'icon': Icons.people, 'color': Colors.green},
                {'title': 'Lokasyonlar', 'value': '8', 'icon': Icons.business, 'color': Colors.orange},
                {'title': 'Bugünkü Rezervasyon', 'value': '15', 'icon': Icons.today, 'color': Colors.purple},
              ];
              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: stats.map((s) => _buildStatCard(
                  s['title'] as String,
                  s['value'] as String,
                  s['icon'] as IconData,
                  s['color'] as Color,
                )).toList(),
              );
            },
          ),
          const SizedBox(height: 32),

          // Recent Activity
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.surfaceBorder,
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Son Aktiviteler',
                    style: _sectionTitleStyle(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'En son sistem aktiviteleri',
                    style: _subtitleStyle(),
                  ),
                  const SizedBox(height: 20),
                  ...List.generate(5, (i) => _buildActivityItem(
                    'Kullanıcı ${i + 1}',
                    'Yeni rezervasyon oluşturdu',
                    '${i + 1} dakika önce',
                  )),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Quick Actions
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: AppTheme.surfaceBorder,
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hızlı İşlemler',
                    style: _sectionTitleStyle(),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Sık kullanılan işlemler',
                    style: _subtitleStyle(),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildQuickAction('Yeni Rezervasyon', Icons.add_circle, Colors.blue),
                      _buildQuickAction('Kullanıcı Ekle', Icons.person_add, Colors.green),
                      _buildQuickAction('Rapor Oluştur', Icons.analytics, Colors.orange),
                      _buildQuickAction('Bildirim Gönder', Icons.notifications, Colors.purple),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.surfaceBorder,
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: _statValueStyle().copyWith(color: color),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: _statLabelStyle(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String user, String action, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.primaryIndigo.withOpacity(0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                user[0],
                style: _activityUserStyle().copyWith(
                  fontSize: 16,
                  color: AppTheme.primaryIndigo,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user, style: _activityUserStyle()),
                const SizedBox(height: 2),
                Text(action, style: _activityActionStyle()),
              ],
            ),
          ),
          Text(time, style: _activityTimeStyle()),
        ],
      ),
    );
  }

  Widget _buildQuickAction(String label, IconData icon, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
