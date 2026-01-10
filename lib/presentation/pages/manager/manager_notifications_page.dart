import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../widgets/common/common.dart';

class ManagerNotificationsPage extends ConsumerStatefulWidget {
  const ManagerNotificationsPage({super.key});

  @override
  ConsumerState<ManagerNotificationsPage> createState() => _ManagerNotificationsPageState();
}

class _ManagerNotificationsPageState extends ConsumerState<ManagerNotificationsPage> {
  // Form States
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String _notificationType = 'info';
  String _selectionMode = 'roles'; // 'roles' veya 'users'

  bool _sending = false;

  final List<String> _selectedUsers = [];
  final List<int> _selectedRoles = [];

  // Mock Data (React tarafındaki yapıyla aynı)
  final List<Map<String, dynamic>> _typeOptions = [
    {'value': 'info', 'label': 'Bilgi', 'icon': Icons.info_outline, 'color': Color(0xFF6366F1)},
    {'value': 'success', 'label': 'Başarı', 'icon': Icons.check_circle_outline, 'color': Color(0xFF22C55E)},
    {'value': 'warning', 'label': 'Uyarı', 'icon': Icons.warning_amber_rounded, 'color': Color(0xFFF59E0B)},
    {'value': 'error', 'label': 'Hata', 'icon': Icons.error_outline, 'color': Color(0xFFEF4444)},
  ];

  final List<Map<String, dynamic>> _roleOptions = [
    {'id': 1, 'name': 'Çalışanlar', 'emoji': '👤'},
    {'id': 2, 'name': 'Yöneticiler', 'emoji': '👔'},
    {'id': 3, 'name': 'Adminler', 'emoji': '🔑'},
  ];

  final List<Map<String, dynamic>> _users = [
    {'id': 'u1', 'name': 'Ahmet Yılmaz', 'email': 'ahmet@ofis.com', 'role': 'Çalışan'},
    {'id': 'u2', 'name': 'Ayşe Demir', 'email': 'ayse@ofis.com', 'role': 'Yönetici'},
    {'id': 'u3', 'name': 'Mehmet Kaya', 'email': 'mehmet@ofis.com', 'role': 'Admin'},
  ];

  final List<Map<String, dynamic>> _notifications = [
    {
      'id': '1',
      'title': 'Sistem Bakımı',
      'message': 'Bu akşam saat 22:00\'de kısa süreli bir bakım çalışması yapılacaktır.',
      'type': 'warning',
      'recipient': 'Tüm Çalışanlar',
      'date': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': true
    },
    {
      'id': '2',
      'title': 'Yeni Özellik!',
      'message': 'Artık mobil uygulama üzerinden check-in yapabilirsiniz.',
      'type': 'success',
      'recipient': 'ayse@ofis.com',
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'isRead': false
    },
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSend() async {
    if (_messageController.text.isEmpty) return;
    
    setState(() => _sending = true);
    // API Call simülasyonu
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bildirim başarıyla gönderildi!'), backgroundColor: Colors.green),
      );
      setState(() {
        _sending = false;
        _messageController.clear();
        _titleController.clear();
        _selectedUsers.clear();
        _selectedRoles.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 900;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageHeader(),
          const SizedBox(height: 32),
          if (isMobile) ...[
            _buildFormCard(),
            const SizedBox(height: 24),
            _buildRecentNotificationsCard(),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildFormCard()),
                const SizedBox(width: 24),
                Expanded(flex: 2, child: _buildRecentNotificationsCard()),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Bildirim Yönetimi', style: GoogleFonts.plusJakartaSans(fontSize: 28, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B))),
        Text('Kullanıcılara toplu bildirim veya duyuru gönderin.', style: GoogleFonts.plusJakartaSans(fontSize: 14, color: const Color(0xFF64748B))),
      ],
    );
  }

  // --- SOL TARAF: FORM ---
  Widget _buildFormCard() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(Icons.send_rounded, 'Yeni Bildirim Gönder'),
          const SizedBox(height: 24),
          _buildTextField('Başlık (Opsiyonel)', _titleController, hint: 'Bildirim başlığı'),
          const SizedBox(height: 20),
          _buildTextField('Mesaj *', _messageController, hint: 'Bildirim metni', maxLines: 4),
          const SizedBox(height: 24),
          _buildTypeSelector(),
          const SizedBox(height: 24),
          _buildSelectionModeToggle(),
          const SizedBox(height: 24),
          _selectionMode == 'roles' ? _buildRoleSelector() : _buildUserSelector(),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton.icon(
              onPressed: _sending ? null : _handleSend,
              icon: _sending ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.send),
              label: Text(_sending ? 'Gönderiliyor...' : 'Bildirimi Gönder', style: const TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
            ),
          ),
        ],
      ),
    );
  }

  // --- SAĞ TARAF: SON BİLDİRİMLER ---
  Widget _buildRecentNotificationsCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(Icons.notifications_none_rounded, 'Son Gönderilenler'),
          const SizedBox(height: 20),
          ..._notifications.map((n) => _buildNotificationItem(n)),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> n) {
    final type = _typeOptions.firstWhere((t) => t['value'] == n['type']);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: type['color'] as Color, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(type['icon'] as IconData, size: 16, color: type['color'] as Color),
              const SizedBox(width: 8),
              Text(n['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              const Spacer(),
              if (n['isRead']) const Icon(Icons.done_all, size: 16, color: Colors.green),
            ],
          ),
          const SizedBox(height: 4),
          Text(n['message'], style: TextStyle(fontSize: 12, color: Colors.grey[600]), maxLines: 2, overflow: TextOverflow.ellipsis),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('→ ${n['recipient']}', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
              Text(DateFormat('dd.MM.yyyy').format(n['date']), style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  // --- YARDIMCI BİLEŞENLER ---

  Widget _buildTypeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Bildirim Türü', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          children: _typeOptions.map((type) {
            bool isSelected = _notificationType == type['value'];
            return InkWell(
              onTap: () => setState(() => _notificationType = type['value']),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? (type['color'] as Color).withOpacity(0.1) : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: isSelected ? type['color'] : const Color(0xFFE5E7EB), width: 2),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(type['icon'], size: 16, color: isSelected ? type['color'] : Colors.grey),
                    const SizedBox(width: 8),
                    Text(type['label'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isSelected ? type['color'] : Colors.grey)),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSelectionModeToggle() {
    return Row(
      children: [
        _toggleBtn('Role Göre', 'roles'),
        const SizedBox(width: 12),
        _toggleBtn('Kişi Seç', 'users'),
      ],
    );
  }

  Widget _toggleBtn(String label, String mode) {
    bool isSelected = _selectionMode == mode;
    return Expanded(
      child: InkWell(
        onTap: () => setState(() => _selectionMode = mode),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFEEF2FF) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: isSelected ? const Color(0xFF6366F1) : const Color(0xFFE5E7EB), width: 2),
          ),
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? const Color(0xFF6366F1) : Colors.grey)),
        ),
      ),
    );
  }

  Widget _buildRoleSelector() {
    return Wrap(
      spacing: 12,
      children: _roleOptions.map((role) {
        bool isSelected = _selectedRoles.contains(role['id']);
        return FilterChip(
          label: Text('${role['emoji']} ${role['name']}'),
          selected: isSelected,
          onSelected: (val) {
            setState(() {
              val ? _selectedRoles.add(role['id']) : _selectedRoles.remove(role['id']);
            });
          },
          selectedColor: const Color(0xFF6366F1),
          checkmarkColor: Colors.white,
          labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
        );
      }).toList(),
    );
  }

  Widget _buildUserSelector() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: const Color(0xFFE5E7EB)), borderRadius: BorderRadius.circular(12)),
      child: ListView(
        shrinkWrap: true,
        children: _users.map((user) {
          bool isSelected = _selectedUsers.contains(user['id']);
          return CheckboxListTile(
            title: Text(user['name'], style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            subtitle: Text('${user['email']} • ${user['role']}', style: const TextStyle(fontSize: 12)),
            value: isSelected,
            activeColor: const Color(0xFF6366F1),
            onChanged: (val) {
              setState(() {
                val! ? _selectedUsers.add(user['id']) : _selectedUsers.remove(user['id']);
              });
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {String? hint, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF374151))),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE5E7EB))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFE5E7EB))),
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(IconData icon, String title) {
    return Row(children: [Icon(icon, size: 20, color: const Color(0xFF312E81)), const SizedBox(width: 10), Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF312E81)))]);
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20, offset: const Offset(0, 10))],
    );
  }
}