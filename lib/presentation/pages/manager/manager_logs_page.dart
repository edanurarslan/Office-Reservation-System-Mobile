import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../widgets/common/common.dart';

class ManagerLogsPage extends ConsumerStatefulWidget {
  const ManagerLogsPage({super.key});

  @override
  ConsumerState<ManagerLogsPage> createState() => _ManagerLogsPageState();
}

class _ManagerLogsPageState extends ConsumerState<ManagerLogsPage> {
  // States & Filters
  bool _loading = false;
  String _searchTerm = '';
  String _actionFilter = 'all';
  String _statusFilter = 'all';
  String _entityTypeFilter = 'all';
  int _page = 1;

  // Mock Data (TSX ile Birebir)
  final Map<String, dynamic> _stats = {
    'totalLogs': 12540,
    'todayLogs': 432,
    'weekLogs': 2850,
    'errorLogs': 24,
  };

  final List<Map<String, dynamic>> _logs = [
    {
      'id': '1',
      'timestamp': '2025-12-28T10:30:00',
      'user': 'admin@ofis.com',
      'userName': 'Admin',
      'action': 'UPDATE',
      'resource': 'Masa 12',
      'resourceType': 'desk',
      'status': 'success',
      'details': 'Masa kapasitesi 4\'ten 6\'ya çıkarıldı.'
    },
    {
      'id': '2',
      'timestamp': '2025-12-28T09:15:00',
      'user': 'manager@ofis.com',
      'userName': 'Yönetici',
      'action': 'APPROVE',
      'resource': 'Toplantı Odası A',
      'resourceType': 'reservation',
      'status': 'success',
      'details': 'Ahmet Yılmaz\'ın rezervasyonu onaylandı.'
    },
    {
      'id': '3',
      'timestamp': '2025-12-27T18:45:00',
      'user': 'system',
      'userName': 'Sistem',
      'action': 'CLEANUP',
      'resource': 'AuditLog',
      'resourceType': 'auditlog',
      'status': 'warning',
      'details': '90 günden eski 150 kayıt temizlendi.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;

    return AppLayout(
      title: 'Sistem Günlükleri',
      currentRoute: '/manager-logs',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageHeader(isMobile),
            const SizedBox(height: 32),
            _buildStatsGrid(isMobile),
            const SizedBox(height: 32),
            _buildFilterCard(isMobile),
            const SizedBox(height: 24),
            _buildLogsContainer(isMobile),
            const SizedBox(height: 32),
            _buildPagination(),
          ],
        ),
      ),
    );
  }

  // --- Header: Yenile ve Temizle ---
  Widget _buildPageHeader(bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sistem Günlükleri',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 28, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B))),
            Text('Sistem aktivitesini ve işlemlerini izleyin.',
                style: GoogleFonts.plusJakartaSans(fontSize: 14, color: const Color(0xFF64748B))),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerButton(Icons.refresh, 'Yenile', Colors.white, const Color(0xFF312E81), true),
            const SizedBox(width: 12),
            _headerButton(Icons.delete_outline, 'Eski Logları Temizle', const Color(0xFFFEE2E2), const Color(0xFF991B1B), false),
          ],
        ),
      ],
    );
  }

  // --- Stats: TSX StatCards ---
  Widget _buildStatsGrid(bool isMobile) {
    return GridView.count(
      crossAxisCount: isMobile ? 1 : 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: isMobile ? 3.5 : 2.2,
      children: [
        _statCard('Toplam Log', _stats['totalLogs'].toString(), Icons.bar_chart, const Color(0xFF6366F1)),
        _statCard('Bugün', _stats['todayLogs'].toString(), Icons.calendar_today, const Color(0xFF10B981)),
        _statCard('Bu Hafta', _stats['weekLogs'].toString(), Icons.calendar_month, const Color(0xFF3B82F6)),
        _statCard('Hatalar', _stats['errorLogs'].toString(), Icons.error_outline, const Color(0xFFEF4444)),
      ],
    );
  }

  // --- Filters: Search and Selects ---
  Widget _buildFilterCard(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _filterItem('Ara', TextField(
                onChanged: (v) => setState(() => _searchTerm = v),
                decoration: _inputDeco('Kullanıcı, kaynak veya ayrıntı ara...'),
              ), width: 300),
              _filterItem('İşlem', _buildDropdown(['all', 'CREATE', 'UPDATE', 'APPROVE', 'DELETE'], _actionFilter, (v) => setState(() => _actionFilter = v!))),
              _filterItem('Kaynak Tipi', _buildDropdown(['all', 'desk', 'reservation', 'user', 'auditlog'], _entityTypeFilter, (v) => setState(() => _entityTypeFilter = v!))),
              _filterItem('Durum', _buildDropdown(['all', 'success', 'warning', 'error'], _statusFilter, (v) => setState(() => _statusFilter = v!))),
            ],
          ),
        ],
      ),
    );
  }

  // --- Table: Desktop/Mobile ---
  Widget _buildLogsContainer(bool isMobile) {
    if (_loading) return const Center(child: Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator()));
    
    return Container(
      decoration: _cardDecoration(),
      clipBehavior: Clip.antiAlias,
      child: isMobile ? _buildMobileList() : _buildDataTable(),
    );
  }

  Widget _buildDataTable() {
    return DataTable(
      horizontalMargin: 20,
      columnSpacing: 20,
      headingRowColor: MaterialStateProperty.all(const Color(0xFFF8FAFC)),
      columns: const [
        DataColumn(label: Text('Zaman')),
        DataColumn(label: Text('Kullanıcı')),
        DataColumn(label: Text('İşlem')),
        DataColumn(label: Text('Kaynak')),
        DataColumn(label: Text('Ayrıntılar')),
        DataColumn(label: Text('Durum')),
      ],
      rows: _logs.map((log) {
        return DataRow(cells: [
          DataCell(_tableText(DateFormat('dd MMM HH:mm').format(DateTime.parse(log['timestamp'])), Icons.calendar_today)),
          DataCell(Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(log['userName'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            Text(log['user'], style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ])),
          DataCell(_badge(log['action'], const Color(0xFFEEF2FF), const Color(0xFF312E81))),
          DataCell(_badge(log['resource'], _getResourceColor(log['resourceType']).withOpacity(0.1), _getResourceColor(log['resourceType']))),
          DataCell(SizedBox(width: 200, child: _tableText(log['details'], Icons.description_outlined))),
          DataCell(_statusBadge(log['status'])),
        ]);
      }).toList(),
    );
  }

  // --- Helper Widgets ---

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
              Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            ],
          )
        ],
      ),
    );
  }

  Widget _statusBadge(String status) {
    final config = status == 'success' 
        ? {'bg': const Color(0xFFDCFCE7), 'text': const Color(0xFF166534), 'label': 'Başarılı'}
        : (status == 'warning' 
            ? {'bg': const Color(0xFFFEF3C7), 'text': const Color(0xFF92400E), 'label': 'Uyarı'}
            : {'bg': const Color(0xFFFEE2E2), 'text': const Color(0xFF991B1B), 'label': 'Hata'});
    return _badge(config['label'] as String, config['bg'] as Color, config['text'] as Color);
  }

  Color _getResourceColor(String type) {
    switch(type) {
      case 'desk': return const Color(0xFF9D174D);
      case 'reservation': return const Color(0xFF312E81);
      case 'user': return const Color(0xFF6B21A8);
      case 'auditlog': return const Color(0xFF475569);
      default: return Colors.blueGrey;
    }
  }

  Widget _badge(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
      child: Text(text, style: TextStyle(color: textCol, fontWeight: FontWeight.bold, fontSize: 11)),
    );
  }

  Widget _tableText(String text, IconData icon) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 14, color: Colors.grey),
      const SizedBox(width: 6),
      Flexible(child: Text(text, style: const TextStyle(fontSize: 13), overflow: TextOverflow.ellipsis)),
    ]);
  }

  Widget _filterItem(String label, Widget child, {double width = 180}) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF312E81))),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }

  Widget _buildDropdown(List<String> items, String val, Function(String?) onChange) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(child: DropdownButton<String>(
        isExpanded: true, value: val,
        items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 13)))).toList(),
        onChanged: onChange,
      )),
    );
  }

  Widget _headerButton(IconData icon, String label, Color bg, Color text, bool outlined) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: bg, foregroundColor: text, elevation: 0,
        side: outlined ? BorderSide(color: text.withOpacity(0.2)) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  InputDecoration _inputDeco(String hint) => InputDecoration(
    hintText: hint, hintStyle: const TextStyle(fontSize: 13),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFE5E7EB))),
  );

  BoxDecoration _cardDecoration() => BoxDecoration(
    color: Colors.white, borderRadius: BorderRadius.circular(20),
    border: Border.all(color: const Color(0xFFE2E8F0)),
    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 16, offset: const Offset(0, 8))],
  );

  Widget _buildMobileList() {
    return ListView.separated(
      shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
      itemCount: _logs.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final log = _logs[index];
        return ListTile(
          title: Text(log['userName'], style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${log['action']} - ${log['resource']}\n${log['timestamp']}'),
          trailing: _statusBadge(log['status']),
        );
      },
    );
  }

  Widget _buildPagination() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _pageBtn('Önceki', false),
      const SizedBox(width: 16),
      const Text('Sayfa 1 / 25', style: TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(width: 16),
      _pageBtn('Sonraki', true),
    ]);
  }

  Widget _pageBtn(String label, bool active) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: active ? const Color(0xFF6366F1) : const Color(0xFFF3F4F6),
        foregroundColor: active ? Colors.white : const Color(0xFF9CA3AF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label),
    );
  }
}