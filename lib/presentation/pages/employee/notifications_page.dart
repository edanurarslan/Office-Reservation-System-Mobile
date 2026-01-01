import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../widgets/common/common.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  String _filterType = 'all';

  // Okunmamış bildirim sayısı
  int get _unreadCount => _notifications.where((n) => n['isRead'] == false).length;

  // Mock Gelen Bildirimler Verisi
  final List<Map<String, dynamic>> _notifications = [
    {
      'id': '1',
      'title': 'Rezervasyon Onaylandı',
      'message': '28 Aralık tarihli Masa 12 rezervasyonunuz yönetici tarafından onaylanmıştır.',
      'type': 'success',
      'createdAt': DateTime.now().subtract(const Duration(hours: 2)),
      'isRead': false,
    },
    {
      'id': '2',
      'title': 'Sistem Bakımı',
      'message': 'Bu akşam saat 22:00\'de sistem genelinde 15 dakikalık bir bakım çalışması yapılacaktır.',
      'type': 'warning',
      'createdAt': DateTime.now().subtract(const Duration(days: 1)),
      'isRead': true,
    },
    {
      'id': '3',
      'title': 'Yeni Ofis Kuralı',
      'message': 'Toplantı odası kullanım süreleri maksimum 2 saat olarak güncellenmiştir.',
      'type': 'info',
      'createdAt': DateTime.now().subtract(const Duration(days: 2)),
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return AppLayout(
      currentRoute: '/notifications',
      title: 'Bildirimlerim',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildFilters(),
            const SizedBox(height: 24),
            _buildNotificationList(isMobile),
          ],
        ),
      ),
    );
  }

  // --- Başlık Bölümü ---
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'Bildirim Merkezi',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E293B),
                ),
              ),
            ),
            if (_unreadCount > 0)
              TextButton.icon(
                onPressed: _markAllAsRead,
                icon: const Icon(Icons.done_all, size: 18),
                label: const Text('Tümünü Okundu İşaretle'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF6366F1),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Sizinle paylaşılan duyuruları takip edebilirsiniz.',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: const Color(0xFF64748B),
          ),
        ),
        if (_unreadCount > 0) ...[
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF6366F1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$_unreadCount okunmamış bildirim',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ],
    );
  }

  // Tümünü okundu işaretle
  void _markAllAsRead() {
    setState(() {
      for (var n in _notifications) {
        n['isRead'] = true;
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Tüm bildirimler okundu olarak işaretlendi'),
        backgroundColor: Color(0xFF22C55E),
      ),
    );
  }

  // Tek bildirimi okundu/okunmadı toggle
  void _toggleReadStatus(Map<String, dynamic> notification) {
    setState(() {
      notification['isRead'] = !(notification['isRead'] as bool);
    });
  }

  // --- Filtreleme Çubukları ---
  Widget _buildFilters() {
    final filters = [
      {'id': 'all', 'label': 'Tümü'},
      {'id': 'unread', 'label': 'Okunmamış'},
      {'id': 'info', 'label': 'Bilgi'},
      {'id': 'success', 'label': 'Onaylar'},
      {'id': 'warning', 'label': 'Uyarılar'},
    ];

    return Wrap(
      spacing: 8,
      children: filters.map((f) {
        bool isSelected = _filterType == f['id'];
        return ChoiceChip(
          label: Text(f['label']!),
          selected: isSelected,
          onSelected: (val) => setState(() => _filterType = f['id']!),
          selectedColor: const Color(0xFF6366F1),
          backgroundColor: Colors.white,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF64748B),
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        );
      }).toList(),
    );
  }

  // --- Bildirim Listesi ---
  Widget _buildNotificationList(bool isMobile) {
    List<Map<String, dynamic>> filteredList;
    
    if (_filterType == 'all') {
      filteredList = _notifications;
    } else if (_filterType == 'unread') {
      filteredList = _notifications.where((n) => n['isRead'] == false).toList();
    } else {
      filteredList = _notifications.where((n) => n['type'] == _filterType).toList();
    }

    if (filteredList.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredList.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final item = filteredList[index];
        return _buildNotificationCard(item);
      },
    );
  }

  Widget _buildNotificationCard(Map<String, dynamic> n) {
    final Color typeColor = _getTypeColor(n['type']);
    final IconData typeIcon = _getTypeIcon(n['type']);
    final bool isRead = n['isRead'] as bool;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isRead ? Colors.white : typeColor.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isRead ? const Color(0xFFE2E8F0) : typeColor.withOpacity(0.2),
          width: 1.5,
        ),
        boxShadow: [
          if (!isRead)
            BoxShadow(
              color: typeColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(typeIcon, color: typeColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (!isRead)
                      Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(color: typeColor, shape: BoxShape.circle),
                      ),
                    Expanded(
                      child: Text(
                        n['title'],
                        style: GoogleFonts.plusJakartaSans(
                          fontWeight: isRead ? FontWeight.w600 : FontWeight.bold,
                          fontSize: 16,
                          color: isRead ? const Color(0xFF64748B) : const Color(0xFF1E293B),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('dd MMM, HH:mm').format(n['createdAt']),
                      style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  n['message'],
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: const Color(0xFF64748B),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                // Okundu/Okunmadı Toggle Butonu
                Row(
                  children: [
                    InkWell(
                      onTap: () => _toggleReadStatus(n),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: isRead ? const Color(0xFFF1F5F9) : const Color(0xFF6366F1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isRead ? Icons.mark_email_unread_outlined : Icons.mark_email_read_outlined,
                              size: 16,
                              color: isRead ? const Color(0xFF64748B) : const Color(0xFF6366F1),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              isRead ? 'Okunmadı İşaretle' : 'Okundu İşaretle',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isRead ? const Color(0xFF64748B) : const Color(0xFF6366F1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Yardımcı Metodlar ---
  Color _getTypeColor(String type) {
    switch (type) {
      case 'success': return const Color(0xFF22C55E);
      case 'warning': return const Color(0xFFF59E0B);
      case 'error': return const Color(0xFFEF4444);
      default: return const Color(0xFF6366F1);
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case 'success': return Icons.check_circle_outline;
      case 'warning': return Icons.warning_amber_rounded;
      case 'error': return Icons.error_outline;
      default: return Icons.info_outline;
    }
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            Icon(Icons.notifications_off_outlined, size: 64, color: Colors.grey[300]),
            const SizedBox(height: 16),
            const Text('Henüz bir bildiriminiz yok', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}