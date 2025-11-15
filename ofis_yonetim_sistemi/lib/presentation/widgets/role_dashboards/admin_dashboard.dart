import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/user.dart';

class AdminDashboard extends StatelessWidget {
  final User user;

  const AdminDashboard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hoş Geldiniz, ${user.firstName}!',
          style: GoogleFonts.inter(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sistem yöneticisi - Tüm yetkilere sahipsiniz',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 32),
        _buildStatsGrid(),
        const SizedBox(height: 32),
        LayoutBuilder(
          builder: (context, constraints) {
            // Responsive layout: 2 columns on large, 1 on small
            bool twoColumns = constraints.maxWidth > 1100;
            
            if (twoColumns) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 2, child: _buildSystemActivity()),
                  const SizedBox(width: 24),
                  Expanded(child: _buildQuickStats()),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildSystemActivity(),
                  const SizedBox(height: 24),
                  _buildQuickStats(),
                ],
              );
            }
          },
        ),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive grid: 5 columns on large screens, 3-4 on medium, 2 on small
        int crossCount = 5;
        if (constraints.maxWidth < 1400) crossCount = 4;
        if (constraints.maxWidth < 1000) crossCount = 3;
        if (constraints.maxWidth < 700) crossCount = 2;
        
        return GridView.count(
          crossAxisCount: crossCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.3,
          children: [
            _buildStatCard(
              'Toplam\nKullanıcı',
              '156',
              Icons.people,
              AppTheme.primaryIndigo,
            ),
            _buildStatCard(
              'Aktif\nRezervaSyon',
              '23',
              Icons.event_available,
              Colors.green,
            ),
            _buildStatCard(
              'Toplam\nOda',
              '12',
              Icons.meeting_room,
              AppTheme.accentIndigo,
            ),
            _buildStatCard(
              'Sistem\nKullanımı',
              '87%',
              Icons.bar_chart,
              Colors.orange,
            ),
            _buildStatCard(
              'Bekleyen\nİşlem',
              '5',
              Icons.pending_actions,
              Colors.red,
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceBorder),
        boxShadow: [AppTheme.shadowLevel2],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const Spacer(),
          Text(
            value.toString(),
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppTheme.textSecondary,
              height: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSystemActivity() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceBorder),
        boxShadow: [AppTheme.shadowLevel3],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.primaryIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.analytics, color: AppTheme.primaryIndigo, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Sistem Aktivitesi',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildActivityLog('Yeni kullanıcı kaydı', 'Mehmet Kaya sisteme eklendi', '5 dakika önce', Icons.person_add, Colors.green),
          const SizedBox(height: 12),
          _buildActivityLog('Rezervasyon onayı', 'Toplantı Odası A rezerve edildi', '15 dakika önce', Icons.check_circle, AppTheme.accentIndigo),
          const SizedBox(height: 12),
          _buildActivityLog('Oda güncelleme', 'Konferans Salonu kapasitesi değişti', '1 saat önce', Icons.edit, Colors.orange),
          const SizedBox(height: 12),
          _buildActivityLog('Sistem yedekleme', 'Otomatik yedekleme tamamlandı', '2 saat önce', Icons.backup, Colors.purple),
        ],
      ),
    );
  }

  Widget _buildActivityLog(String title, String description, String time, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppTheme.textSecondary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 10,
              color: AppTheme.textSecondary,
            ),
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStats() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceBorder),
        boxShadow: [AppTheme.shadowLevel3],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.trending_up, color: Colors.green, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Hızlı İstatistikler',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildQuickStatItem('Bugünkü Rezervasyon', '18', Icons.today, AppTheme.primaryIndigo),
          const SizedBox(height: 16),
          _buildQuickStatItem('Haftalık Büyüme', '+12%', Icons.arrow_upward, Colors.green),
          const SizedBox(height: 16),
          _buildQuickStatItem('Aylık Gelir', '₺45,200', Icons.payments, AppTheme.accentIndigo),
          const SizedBox(height: 16),
          _buildQuickStatItem('Kullanıcı Memnuniyeti', '4.8/5', Icons.star, Colors.amber),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryIndigo, AppTheme.accentIndigo],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(Icons.admin_panel_settings, color: Colors.white, size: 32),
                const SizedBox(height: 8),
                Text(
                  'Admin Panel',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tüm yetkilere erişim',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStatItem(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: AppTheme.textSecondary,
                ),
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
