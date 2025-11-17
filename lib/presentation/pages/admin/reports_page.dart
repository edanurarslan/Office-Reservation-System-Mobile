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
                          'Detaylı kullanım raporlarını görüntüleyin',
                          style: _subtitleStyle(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Report Types
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildReportCard('Rezervasyon Raporu', Icons.event_note, AppTheme.primaryIndigo),
                  _buildReportCard('Kullanım Analizi', Icons.bar_chart, Colors.green),
                  _buildReportCard('Kullanıcı Aktivitesi', Icons.people, Colors.orange),
                  _buildReportCard('Oda Doluluk Oranı', Icons.meeting_room, Colors.purple),
                  _buildReportCard('Kaynak Kullanımı', Icons.inventory_2, AppTheme.accentIndigo),
                  _buildReportCard('Finansal Rapor', Icons.attach_money, Colors.teal),
                ],
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
                            'Bu sayfa Manager ve Admin kullanıcılar tarafından görüntülenebilir.',
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

  Widget _buildReportCard(String title, IconData icon, Color color) {
    return Container(
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
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
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
          const SizedBox(height: 16),
          Text(
            title,
            style: _reportCardTitleStyle(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
