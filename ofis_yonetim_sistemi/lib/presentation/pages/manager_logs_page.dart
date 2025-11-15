import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/app_layout.dart';
import '../widgets/permission_guard_widget.dart';
import '../../core/theme/app_theme.dart';

class ManagerLogsPage extends ConsumerStatefulWidget {
  const ManagerLogsPage({super.key});

  @override
  ConsumerState<ManagerLogsPage> createState() => _ManagerLogsPageState();
}

class _ManagerLogsPageState extends ConsumerState<ManagerLogsPage> {
  final List<Map<String, String>> _logs = [
    {
      'id': 'log1',
      'user': 'Ofis Kullanıcı',
      'action': 'Rezervasyon oluşturdu',
      'date': '2025-10-29 15:10',
    },
    {
      'id': 'log2',
      'user': 'Yönetici',
      'action': 'Kural güncelledi',
      'date': '2025-10-30 09:45',
    },
    {
      'id': 'log3',
      'user': 'Admin',
      'action': 'Kullanıcı ekledi',
      'date': '2025-10-31 11:30',
    },
    {
      'id': 'log4',
      'user': 'Ofis Kullanıcı',
      'action': 'QR kod taradı',
      'date': '2025-11-01 09:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Manager Logs',
      currentRoute: '/manager-logs',
      child: PermissionGuardWidget(
        requiredRoute: '/manager-logs',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'Log ve Aktivite Geçmişi',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Sistem aktivitelerini ve geçmiş işlemleri görüntüleyin.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primaryIndigo,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Logs Table
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppTheme.surfaceBorder),
                    ),
                    child: Column(
                      children: [
                        // Table Header
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppTheme.primaryIndigo.withOpacity(0.08),
                                AppTheme.accentIndigo.withOpacity(0.08),
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Kullanıcı',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryIndigo,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'İşlem',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryIndigo,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'Tarih',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppTheme.primaryIndigo,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Table Rows
                        if (_logs.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(32),
                            child: Center(
                              child: Text(
                                'Log kaydı yok.',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ),
                          )
                        else
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _logs.length,
                            separatorBuilder: (context, index) => const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final log = _logs[index];
                              return Container(
                                padding: const EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        log['user'] ?? '',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme.textPrimary,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        log['action'] ?? '',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          color: AppTheme.textSecondary,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        log['date'] ?? '',
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          color: AppTheme.textTertiary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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
