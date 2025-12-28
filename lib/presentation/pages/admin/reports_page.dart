import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../widgets/common/common.dart';

class ReportsPage extends ConsumerWidget with PermissionCheckMixin {
  const ReportsPage({super.key});

  TextStyle _headingStyle() => GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppTheme.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );

  TextStyle _subtitleStyle() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppTheme.textSecondary,
    height: 1.4,
    letterSpacing: 0.3,
  );

  TextStyle _reportCardTitleStyle() => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppTheme.textPrimary,
    height: 1.4,
    letterSpacing: 0.2,
  );

  TextStyle _infoPanelTitleStyle() => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.blue,
    height: 1.3,
    letterSpacing: -0.2,
  );

  TextStyle _infoPanelDescriptionStyle() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
    height: 1.5,
    letterSpacing: 0.1,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionGuardWidget(
      requiredRoute: '/reports',
      child: AppLayout(
        currentRoute: '/reports',
        title: 'Raporlar',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppTheme.primaryIndigo, AppTheme.accentIndigo],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.analytics, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Raporlar ve Analitik',
                          style: _headingStyle(),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Kullanım, rezervasyon ve kaynak analizlerini kolayca görüntüleyin. Raporlara tıklayarak detaylara ulaşabilirsiniz.',
                          style: _subtitleStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Report Types (Clickable)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildClickableReportCard(context, 'Rezervasyon Raporu', Icons.event_note, AppTheme.primaryIndigo, 'Toplam Rezervasyon: 120'),
                  _buildClickableReportCard(context, 'Kullanım Analizi', Icons.bar_chart, Colors.green, 'Ortalama Doluluk: %78'),
                  _buildClickableReportCard(context, 'Kullanıcı Aktivitesi', Icons.people, Colors.orange, 'Aktif Kullanıcı: 34'),
                  _buildClickableReportCard(context, 'Oda Doluluk Oranı', Icons.meeting_room, Colors.purple, 'En yoğun oda: A-101'),
                  _buildClickableReportCard(context, 'Kaynak Kullanımı', Icons.inventory_2, AppTheme.accentIndigo, 'En çok kullanılan: Projeksiyon'),
                  _buildClickableReportCard(context, 'Finansal Rapor', Icons.attach_money, Colors.teal, 'Toplam Gelir: ₺12.500'),
                ],
              ),
              const SizedBox(height: 32),

              // Example Statistics Panel
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Özet İstatistikler', style: _infoPanelTitleStyle().copyWith(fontSize: 18)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatItem('Toplam Rezervasyon', '120'),
                          _buildStatItem('Ortalama Doluluk', '%78'),
                          _buildStatItem('Aktif Kullanıcı', '34'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Info
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.blue.shade200,
                    width: 1.2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue.shade700, size: 32),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rapor Erişimi',
                            style: _infoPanelTitleStyle().copyWith(color: Colors.blue.shade900),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Bu sayfa tüm roller tarafından görüntülenebilir. Raporlara tıklayarak detaylara ulaşabilirsiniz.',
                            style: _infoPanelDescriptionStyle().copyWith(color: Colors.blue.shade800),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableReportCard(BuildContext context, String title, IconData icon, Color color, String stat) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title detayları yakında!'), backgroundColor: color, duration: const Duration(seconds: 2)),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.surfaceBorder,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(title, style: _reportCardTitleStyle(), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(stat, style: _subtitleStyle().copyWith(color: color, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(value, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo)),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.inter(fontSize: 13, color: Colors.grey[700])),
      ],
    );
  }
}
