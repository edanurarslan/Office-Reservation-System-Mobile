import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../application/providers/auth_provider.dart';
import '../widgets/app_layout.dart';
import '../widgets/common/reservation_create_form.dart';

// Rezervasyon durumları için yapılandırma
enum ReservationStatus { pending, approved, rejected }

class ReservationsPage extends ConsumerWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    // Örnek veri (API'den geliyormuş gibi)
    final reservations = [
      {'desk': 'Masa 12', 'employee': 'Ahmet Yılmaz', 'date': '2025-12-28', 'time': '09:00-18:00', 'status': ReservationStatus.pending},
      {'desk': 'Toplantı Odası A', 'employee': 'Ayşe Demir', 'date': '2025-12-29', 'time': '14:00-15:00', 'status': ReservationStatus.approved},
    ];

    final pendingCount = reservations.where((r) => r['status'] == ReservationStatus.pending).length;

    return SingleChildScrollView(
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPageHeader(context, user?.id, isMobile),
          const SizedBox(height: 24),
          // Beklemede olanlar banner (React tarafındaki sarı banner)
          if (pendingCount > 0) _buildPendingBanner(pendingCount),
          const SizedBox(height: 24),
          // Tablo veya Liste Görünümü
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
              ),
              child: isMobile 
                ? _buildMobileList(reservations) 
                : _buildDataTable(reservations),
            ),
          ],
        ),
    );
  }

  // --- Header ---
  Widget _buildPageHeader(BuildContext context, String? userId, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rezervasyon Onayları',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 22 : 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1E293B),
              ),
            ),
            Text(
              'Çalışanların rezervasyon isteklerini yönetin.',
              style: GoogleFonts.inter(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
        if (!isMobile)
          ElevatedButton.icon(
            onPressed: userId != null ? () => _showReservationForm(context, userId) : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4F46E5),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.add, size: 18),
            label: const Text('Yeni Rezervasyon'),
          ),
      ],
    );
  }

  // --- Sarı Uyarı Banner ---
  Widget _buildPendingBanner(int count) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFEF3C7), Color(0xFFFCD34D)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFBBF24),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.access_time_filled, color: Color(0xFF92400E)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$count Beklemede Rezervasyon',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF92400E), fontSize: 16),
                ),
                Text(
                  'Lütfen beklemede olan rezervasyonları gözden geçirin',
                  style: GoogleFonts.inter(color: const Color(0xFFB45309), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Masaüstü İçin Data Table ---
  Widget _buildDataTable(List<Map<String, dynamic>> data) {
    return DataTable(
      columnSpacing: 40,
      headingTextStyle: GoogleFonts.inter(fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
      dataRowMaxHeight: 70,
      columns: const [
        DataColumn(label: Text('Masa/Oda')),
        DataColumn(label: Text('Çalışan')),
        DataColumn(label: Text('Tarih/Saat')),
        DataColumn(label: Text('Durum')),
        DataColumn(label: Text('İşlemler')),
      ],
      rows: data.map((item) {
        return DataRow(cells: [
          DataCell(Text(item['desk'], style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF312E81)))),
          DataCell(Text(item['employee'])),
          DataCell(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item['date'], style: const TextStyle(fontSize: 12)),
              Text(item['time'], style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          )),
          DataCell(_buildStatusBadge(item['status'])),
          DataCell(_buildActionButtons()),
        ]);
      }).toList(),
    );
  }

  // --- Mobil İçin Kart Listesi ---
  Widget _buildMobileList(List<Map<String, dynamic>> data) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final item = data[index];
        return ListTile(
          contentPadding: const EdgeInsets.all(16),
          title: Text(item['desk'], style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('${item['employee']}\n${item['date']} | ${item['time']}'),
          trailing: _buildStatusBadge(item['status']),
        );
      },
    );
  }

  // --- Durum Etiketi (Badge) ---
  Widget _buildStatusBadge(ReservationStatus status) {
    Color bg;
    Color text;
    String label;

    switch (status) {
      case ReservationStatus.pending:
        bg = const Color(0xFFFEF3C7);
        text = const Color(0xFF92400E);
        label = 'Beklemede';
        break;
      case ReservationStatus.approved:
        bg = const Color(0xFFDCFCE7);
        text = const Color(0xFF166534);
        label = 'Onaylandı';
        break;
      case ReservationStatus.rejected:
        bg = const Color(0xFFFEE2E2);
        text = const Color(0xFF991B1B);
        label = 'Reddedildi';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(
        label,
        style: GoogleFonts.inter(color: text, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }

  // --- İşlem Butonları (Onayla/Reddet) ---
  Widget _buildActionButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.check_circle_outline, color: Colors.green),
          tooltip: 'Onayla',
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.highlight_off, color: Colors.red),
          tooltip: 'Reddet',
        ),
      ],
    );
  }

  void _showReservationForm(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: ReservationCreateForm(
          userId: userId,
          onSuccess: () {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Rezervasyon başarıyla oluşturuldu!'), backgroundColor: Colors.green),
            );
          },
        ),
      ),
    );
  }
}