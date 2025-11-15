import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_layout.dart';
import '../widgets/permission_guard_widget.dart';
import '../../core/theme/app_theme.dart';

class ManagerReportsPage extends ConsumerWidget {
  const ManagerReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trends = [
      {'label': 'Haftalık Rezervasyon Artışı', 'value': '+8%'},
      {'label': 'En Yoğun Gün', 'value': 'Perşembe'},
      {'label': 'En Çok Kullanılan Masa', 'value': 'B202'},
      {'label': 'Son 30 Gün Rezervasyon', 'value': '210'},
    ];

    final chartData = [
      8, 12, 10, 15, 14, 18, 16, 20, 22, 21, 19, 18, 17, 15, 14, 
      13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 2, 1, 1
    ];

    return AppLayout(
      title: 'Manager Reports',
      currentRoute: '/manager-reports',
      child: PermissionGuardWidget(
        requiredRoute: '/manager-reports',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'Raporlama & Analitik Dashboard',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Rezervasyon trendleri, en yoğun günler ve masa/oda kullanım analizleri.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primaryIndigo,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Trend Cards
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: trends.length,
                    itemBuilder: (context, index) {
                      final trend = trends[index];
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppTheme.primaryIndigo.withOpacity(0.08),
                              AppTheme.accentIndigo.withOpacity(0.08),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppTheme.surfaceBorder),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              trend['value']!,
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.primaryIndigo,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              trend['label']!,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 32),

                  // Chart
                  Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppTheme.primaryIndigo.withOpacity(0.08),
                          AppTheme.accentIndigo.withOpacity(0.08),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.surfaceBorder),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Son 30 Gün Rezervasyon Grafiği',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryIndigo,
                          ),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          height: 200,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: chartData.asMap().entries.map((entry) {
                              final index = entry.key;
                              final value = entry.value;
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: value * 6.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppTheme.accentIndigo,
                                              AppTheme.primaryIndigo,
                                            ],
                                          ),
                                          borderRadius: const BorderRadius.vertical(
                                            top: Radius.circular(4),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      if (index % 5 == 0)
                                        Text(
                                          '${index + 1}',
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                            color: AppTheme.textTertiary,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
