import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';

class LocationsPage extends ConsumerStatefulWidget {
  const LocationsPage({super.key});

  @override
  ConsumerState<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends ConsumerState<LocationsPage> {
  // States
  bool _isLoading = false;
  String? _error;
  
  // React tarafındaki veri yapısıyla aynı mock data
  List<LocationModel> _locations = [
    LocationModel(id: '1', name: 'Ana Ofis', address: 'Maslak, İstanbul', isActive: true),
    LocationModel(id: '2', name: 'Ar-Ge Merkezi', address: 'Teknopark, Ankara', isActive: true),
    LocationModel(id: '3', name: 'Depo / Lojistik', address: 'Nilüfer, Bursa', isActive: false),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return PermissionGuardWidget(
      requiredRoute: '/locations',
      child: AppLayout(
        currentRoute: '/locations',
        title: 'Lokasyonlar',
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isMobile ? 16 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeader(isMobile),
              const SizedBox(height: 32),
              _buildMainContent(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  // --- Header: Başlık, Açıklama ve Yeni Ekle Butonu ---
  Widget _buildPageHeader(bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 20,
      runSpacing: 20,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokasyonlar',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Tüm ofis lokasyonlarını yönetin.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () => print('Yeni Lokasyon'),
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Yeni Lokasyon'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F46E5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 8,
            shadowColor: const Color(0xFF4F46E5).withOpacity(0.4),
          ),
        ),
      ],
    );
  }

  // --- Main Card: Tablo ve İçerik ---
  Widget _buildMainContent(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0).withOpacity(0.8)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1F2687).withOpacity(0.07),
            blurRadius: 32,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: _isLoading 
        ? const Center(child: Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator()))
        : _error != null 
          ? _buildErrorState()
          : _locations.isEmpty 
            ? _buildEmptyState()
            : isMobile ? _buildMobileList() : _buildDesktopTable(),
    );
  }

  // --- Desktop: React Table Görünümü ---
  Widget _buildDesktopTable() {
    return DataTable(
      horizontalMargin: 0,
      columnSpacing: 24,
      headingRowHeight: 56,
      dataRowMaxHeight: 72,
      headingTextStyle: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF64748B),
        fontSize: 14,
      ),
      columns: const [
        DataColumn(label: Text('Lokasyon Adı')),
        DataColumn(label: Text('Adres')),
        DataColumn(label: Text('Durum')),
        DataColumn(label: Text('İşlemler')),
      ],
      rows: _locations.map((loc) {
        return DataRow(cells: [
          DataCell(Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Color(0xFF6366F1), size: 18),
              const SizedBox(width: 8),
              Text(loc.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF312E81))),
            ],
          )),
          DataCell(Text(loc.address, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13))),
          DataCell(_buildStatusBadge(loc.isActive)),
          DataCell(_buildActionButtons(loc)),
        ]);
      }).toList(),
    );
  }

  // --- Mobil: Kart Listesi ---
  Widget _buildMobileList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _locations.length,
      separatorBuilder: (_, __) => const Divider(height: 32),
      itemBuilder: (context, index) {
        final loc = _locations[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(loc.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                _buildStatusBadge(loc.isActive),
              ],
            ),
            const SizedBox(height: 8),
            Text(loc.address, style: const TextStyle(color: Color(0xFF64748B))),
            const SizedBox(height: 16),
            _buildActionButtons(loc),
          ],
        );
      },
    );
  }

  // --- Helpers: Badge ve Butonlar ---
  Widget _buildStatusBadge(bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? 'Aktif' : 'Pasif',
        style: TextStyle(
          color: isActive ? const Color(0xFF166534) : const Color(0xFF991B1B),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButtons(LocationModel loc) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OutlinedButton.icon(
          onPressed: () => print('Edit ${loc.id}'),
          icon: const Icon(Icons.edit, size: 14),
          label: const Text('Düzenle'),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF312E81),
            side: const BorderSide(color: Color(0xFFE2E8F0)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () => setState(() => _locations.removeWhere((l) => l.id == loc.id)),
          icon: const Icon(Icons.delete_outline, size: 14),
          label: const Text('Sil'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFEF2F2),
            foregroundColor: const Color(0xFF991B1B),
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Text('Lokasyon bulunamadı', style: TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(child: Text(_error!, style: const TextStyle(color: Colors.red)));
  }
}

// Model - TSX tarafındaki yapı ile aynı
class LocationModel {
  final String id;
  final String name;
  final String address;
  final bool isActive;

  LocationModel({
    required this.id,
    required this.name,
    required this.address,
    required this.isActive,
  });
}