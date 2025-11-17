import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/user.dart';

class ManagerDashboard extends StatelessWidget {
  final User user;

  const ManagerDashboard({
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
          'Ekip yönetimi ve raporlama yetkilerine sahipsiniz',
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
            bool twoColumns = constraints.maxWidth > 1100;
            
            if (twoColumns) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildPendingApprovals()),
                  const SizedBox(width: 24),
                  Expanded(child: _buildTeamActivity()),
                ],
              );
            } else {
              return Column(
                children: [
                  _buildPendingApprovals(),
                  const SizedBox(height: 24),
                  _buildTeamActivity(),
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
        // Responsive grid: 4 columns on large, 2-3 on medium, 2 on small
        int crossCount = 4;
        if (constraints.maxWidth < 1200) crossCount = 3;
        if (constraints.maxWidth < 900) crossCount = 2;
        
        return GridView.count(
          crossAxisCount: crossCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.3,
          children: [
            _buildStatCard(
              'Ekip\nRezervasyonları',
              '12',
              Icons.groups,
              AppTheme.primaryIndigo,
            ),
            _buildStatCard(
              'Bekleyen\nOnaylar',
              '3',
              Icons.pending_actions,
              Colors.orange,
            ),
            _buildStatCard(
              'Kaynak\nKullanımı',
              '78%',
              Icons.bar_chart,
              AppTheme.accentIndigo,
            ),
            _buildStatCard(
              'Departman\nBüyüklüğü',
              '${user.department ?? "N/A"}',
              Icons.people,
              Colors.green,
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

  Widget _buildPendingApprovals() {
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
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.pending_actions, color: Colors.orange, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Bekleyen Onaylar',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildApprovalItem('Toplantı Odası A', 'Ahmet Yılmaz', '14:00 - 15:00'),
          const SizedBox(height: 12),
          _buildApprovalItem('Konferans Salonu', 'Ayşe Demir', '10:00 - 12:00'),
          const SizedBox(height: 12),
          _buildApprovalItem('Proje Odası 2', 'Mehmet Kaya', 'Yarın 09:00'),
        ],
      ),
    );
  }

  Widget _buildApprovalItem(String room, String requester, String time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  room,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$requester • $time',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.check_circle, color: Colors.green, size: 20),
                onPressed: () {},
                tooltip: 'Onayla',
              ),
              IconButton(
                icon: const Icon(Icons.cancel, color: Colors.red, size: 20),
                onPressed: () {},
                tooltip: 'Reddet',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamActivity() {
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
                  color: AppTheme.accentIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.trending_up, color: AppTheme.accentIndigo, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Ekip Aktivitesi',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildActivityItem('Bu Hafta', '24 Rezervasyon', Icons.calendar_today, AppTheme.primaryIndigo),
          const SizedBox(height: 12),
          _buildActivityItem('Bu Ay', '89 Rezervasyon', Icons.calendar_month, AppTheme.accentIndigo),
          const SizedBox(height: 12),
          _buildActivityItem('Ortalama Kullanım', '4.2 saat/gün', Icons.access_time, Colors.green),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String label, String value, IconData icon, Color color) {
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
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
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
