import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../widgets/common/common.dart';

class LogsPage extends ConsumerStatefulWidget {
  const LogsPage({super.key});

  @override
  ConsumerState<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends ConsumerState<LogsPage> with PermissionCheckMixin {
  String _filterType = 'Tümü';
  
  // TextStyle Helpers
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

  TextStyle _logActionStyle() => GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppTheme.textPrimary,
    height: 1.4,
    letterSpacing: 0.2,
  );

  TextStyle _logMetaStyle() => GoogleFonts.inter(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppTheme.textSecondary,
    height: 1.4,
    letterSpacing: 0.1,
  );

  TextStyle _filterLabelStyle() => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppTheme.textPrimary,
    height: 1.3,
    letterSpacing: 0.2,
  );
  
  final List<SystemLog> _logs = [
    SystemLog(id: '1', user: 'admin@ofis.com', action: 'Giriş yaptı', type: 'Auth', timestamp: '2025-11-11 14:30'),
    SystemLog(id: '2', user: 'user@ofis.com', action: 'Rezervasyon oluşturdu', type: 'Reservation', timestamp: '2025-11-11 14:25'),
    SystemLog(id: '3', user: 'manager@ofis.com', action: 'Kullanıcı ekledi', type: 'User', timestamp: '2025-11-11 14:20'),
    SystemLog(id: '4', user: 'admin@ofis.com', action: 'Lokasyon güncelledi', type: 'Location', timestamp: '2025-11-11 14:15'),
    SystemLog(id: '5', user: 'user@ofis.com', action: 'QR kod taradı', type: 'QR', timestamp: '2025-11-11 14:10'),
  ];

  List<SystemLog> get filteredLogs {
    if (_filterType == 'Tümü') return _logs;
    return _logs.where((log) => log.type == _filterType).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PermissionGuardWidget(
      requiredRoute: '/logs',
      child: AppLayout(
        currentRoute: '/logs',
        title: 'Sistem Logları',
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
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
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sistem Aktivite Logları',
                          style: _headingStyle(),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tüm kullanıcı aktivitelerini ve sistem olaylarını görüntüleyin.',
                          style: _subtitleStyle(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryIndigo.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.history, size: 28, color: AppTheme.primaryIndigo),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Filter
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
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Text('Filtrele:', style: _filterLabelStyle()),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Wrap(
                      spacing: 8,
                      children: ['Tümü', 'Auth', 'Reservation', 'User', 'Location', 'QR'].map((type) {
                        final isSelected = _filterType == type;
                        return ChoiceChip(
                          label: Text(type),
                          selected: isSelected,
                          onSelected: (selected) => setState(() => _filterType = type),
                          selectedColor: AppTheme.primaryIndigo,
                          backgroundColor: Colors.white,
                          labelStyle: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.white : AppTheme.primaryIndigo,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: AppTheme.surfaceBorder,
                              width: isSelected ? 0 : 1.2,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Logs List
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
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredLogs.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: AppTheme.surfaceBorder,
                thickness: 1,
              ),
              itemBuilder: (context, index) {
                final log = filteredLogs[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _getTypeColor(log.type).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      _getTypeIcon(log.type),
                      color: _getTypeColor(log.type),
                      size: 20,
                    ),
                  ),
                  title: Text(log.action, style: _logActionStyle()),
                  subtitle: Text(
                    '${log.user} • ${log.timestamp}',
                    style: _logMetaStyle(),
                  ),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getTypeColor(log.type).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      log.type,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: _getTypeColor(log.type),
                        height: 1.2,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type) {
      case 'Auth': return Colors.blue;
      case 'Reservation': return Colors.green;
      case 'User': return Colors.purple;
      case 'Location': return Colors.orange;
      case 'QR': return Colors.teal;
      default: return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'Auth': return Icons.login;
      case 'Reservation': return Icons.event;
      case 'User': return Icons.person;
      case 'Location': return Icons.location_on;
      case 'QR': return Icons.qr_code;
      default: return Icons.info;
    }
  }
}

class SystemLog {
  final String id;
  final String user;
  final String action;
  final String type;
  final String timestamp;

  SystemLog({
    required this.id,
    required this.user,
    required this.action,
    required this.type,
    required this.timestamp,
  });
}
