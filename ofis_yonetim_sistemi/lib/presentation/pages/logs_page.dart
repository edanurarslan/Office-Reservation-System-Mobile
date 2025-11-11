import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/app_layout.dart';
import '../widgets/permission_guard_widget.dart';

class LogsPage extends ConsumerStatefulWidget {
  const LogsPage({super.key});

  @override
  ConsumerState<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends ConsumerState<LogsPage> with PermissionCheckMixin {
  String _filterType = 'Tümü';
  
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
          Card(
            elevation: 2,
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
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo[900],
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tüm kullanıcı aktivitelerini ve sistem olaylarını görüntüleyin.',
                          style: TextStyle(color: Colors.indigo[600]),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.history, size: 40, color: Colors.indigo[300]),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Filter
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text('Filtrele: ', style: TextStyle(fontWeight: FontWeight.bold)),
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
                          selectedColor: Colors.indigo,
                          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.indigo[700]),
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
          Card(
            elevation: 2,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredLogs.length,
              separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey[200]),
              itemBuilder: (context, index) {
                final log = filteredLogs[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _getTypeColor(log.type),
                    child: Icon(_getTypeIcon(log.type), color: Colors.white, size: 20),
                  ),
                  title: Text(log.action, style: const TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text('${log.user} • ${log.timestamp}'),
                  trailing: Chip(
                    label: Text(log.type, style: const TextStyle(fontSize: 11)),
                    backgroundColor: _getTypeColor(log.type).withOpacity(0.2),
                    labelStyle: TextStyle(color: _getTypeColor(log.type)),
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
