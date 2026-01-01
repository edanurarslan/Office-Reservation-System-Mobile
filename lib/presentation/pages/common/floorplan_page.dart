import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';

class FloorplanPage extends ConsumerStatefulWidget {
  const FloorplanPage({super.key});

  @override
  ConsumerState<FloorplanPage> createState() => _FloorplanPageState();
}

class _FloorplanPageState extends ConsumerState<FloorplanPage> {
  // States - React tarafındaki state yapısıyla aynı
  String _selectedLocation = 'Lokasyon A';
  String _selectedFloor = '1. Kat';
  String _selectedZone = 'A Bölgesi';
  Map<String, dynamic>? _selectedDesk;
  bool _hasChanges = false;

  // Mock Data - Varsayılan 2 masa
  final List<Map<String, dynamic>> _desks = [
    {
      'id': 'd0',
      'name': 'Masa 1',
      'x': 100.0,
      'y': 100.0,
      'zone': 'A Bölgesi',
      'hasMonitor': true,
    },
    {
      'id': 'd1',
      'name': 'Masa 2',
      'x': 250.0,
      'y': 100.0,
      'zone': 'B Bölgesi',
      'hasMonitor': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1100;

    return AppLayout(
      currentRoute: '/floorplan',
      title: 'Kat Planı Yönetimi',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageHeader(isMobile),
            const SizedBox(height: 24),
            _buildControls(isMobile),
            const SizedBox(height: 24),
            if (isMobile) ...[
              _buildCanvas(screenWidth),
              const SizedBox(height: 24),
              _buildSidebar(),
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildCanvas(screenWidth)),
                  const SizedBox(width: 24),
                  _buildSidebar(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // --- Header ---
  Widget _buildPageHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kat Planı Yönetimi',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E293B),
          ),
        ),
        Text(
          'Ofis kat planlarını ve masa konumlarını yönetin.',
          style: GoogleFonts.plusJakartaSans(color: const Color(0xFF64748B)),
        ),
      ],
    );
  }

  // --- Üst Kontroller (Dropdowns & Buttons) ---
  Widget _buildControls(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildDropdown(Icons.business, _selectedLocation, ['Lokasyon A', 'Lokasyon B']),
        _buildDropdown(Icons.layers, _selectedFloor, ['1. Kat', '2. Kat']),
        _buildDropdown(Icons.map_outlined, _selectedZone, ['A Bölgesi', 'B Bölgesi']),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Masa Ekle'),
          style: _btnStyle(const Color(0xFF4F46E5)),
        ),
        if (_hasChanges)
          ElevatedButton.icon(
            onPressed: () => setState(() => _hasChanges = false),
            icon: const Icon(Icons.save, size: 18),
            label: const Text('Kaydet'),
            style: _btnStyle(const Color(0xFF10B981)),
          ),
      ],
    );
  }

  // --- Kat Planı Alanı (Canvas) ---
  double _canvasWidth = 700;
  static const double _canvasHeight = 600;
  static const double _deskSize = 50;

  Widget _buildCanvas(double screenWidth) {
    // Responsive genişlik: min 300, max 700, parent'a göre ayarlanır
    double canvasWidth = screenWidth;
    if (screenWidth > 1100) {
      canvasWidth = 700;
    } else if (screenWidth > 600) {
      canvasWidth = screenWidth * 0.6;
    } else {
      canvasWidth = screenWidth - 32; // padding
    }
    canvasWidth = canvasWidth.clamp(300.0, 700.0);
    _canvasWidth = canvasWidth;
    return Center(
      child: Container(
        width: canvasWidth,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              _buildGridBackground(),
              ..._desks.map((desk) => _buildDraggableDesk(desk)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDraggableDesk(Map<String, dynamic> desk) {
    bool isSelected = _selectedDesk?['id'] == desk['id'];
    return Positioned(
      left: desk['x'],
      top: desk['y'],
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            // Yeni pozisyonu hesapla
            double newX = desk['x'] + details.delta.dx;
            double newY = desk['y'] + details.delta.dy;
            
            // Sınırlar içinde tut (0 ile canvas boyutu - masa boyutu arasında)
            newX = newX.clamp(0.0, _canvasWidth - _deskSize);
            newY = newY.clamp(0.0, _canvasHeight - _deskSize);
            
            desk['x'] = newX;
            desk['y'] = newY;
            _hasChanges = true;
          });
        },
        onTap: () => setState(() => _selectedDesk = desk),
        child: Container(
          width: _deskSize,
          height: _deskSize,
          decoration: BoxDecoration(
            color: desk['zone'] == 'A Bölgesi' ? const Color(0xFF6366F1) : const Color(0xFFF59E0B),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (isSelected)
                BoxShadow(color: Colors.blue.withOpacity(0.5), blurRadius: 0, spreadRadius: 4),
              const BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
            ],
          ),
          child: const Icon(Icons.monitor, color: Colors.white, size: 24),
        ),
      ),
    );
  }

  // --- Sağ Sidebar (Detaylar) ---
  Widget _buildSidebar() {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          _buildZoneLegend(),
          const SizedBox(height: 16),
          if (_selectedDesk != null) _buildDeskDetails(),
        ],
      ),
    );
  }

  Widget _buildZoneLegend() {
    // Bölgelere göre masa sayısını hesapla
    int aCount = _desks.where((d) => d['zone'] == 'A Bölgesi').length;
    int bCount = _desks.where((d) => d['zone'] == 'B Bölgesi').length;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _sidebarDeco(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Bölgeler', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _legendItem('A Bölgesi', const Color(0xFF6366F1), aCount),
          _legendItem('B Bölgesi', const Color(0xFFF59E0B), bCount),
        ],
      ),
    );
  }

  Widget _buildDeskDetails() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _sidebarDeco(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.settings, size: 16, color: Color(0xFF6366F1)),
              const SizedBox(width: 8),
              const Text('Masa Detayları', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          _detailField('MASA ADI', _selectedDesk!['name']),
          _detailField('BÖLGE', _selectedDesk!['zone']),
          _detailField('KOORDİNATLAR', 'X: ${_selectedDesk!['x'].toInt()}, Y: ${_selectedDesk!['y'].toInt()}'),
          const SizedBox(height: 16),
          const Text('DONANIM', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 4,
            children: [
              _hardwareBadge('🖥️ Monitör', _selectedDesk!['hasMonitor']),
              _hardwareBadge('⌨️ Klavye', true),
              _hardwareBadge('🖱️ Mouse', true),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Düzenle'))),
              const SizedBox(width: 8),
              IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline, color: Colors.red)),
            ],
          )
        ],
      ),
    );
  }

  // --- Yardımcı Widgetlar ---
  Widget _buildDropdown(IconData icon, String value, List<String> items) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF6366F1)),
          const SizedBox(width: 8),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              items: items.map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 14)))).toList(),
              onChanged: (v) => setState(() {
                if (items.contains('1. Kat')) _selectedFloor = v!;
                else if (items.contains('Lokasyon A')) _selectedLocation = v!;
                else _selectedZone = v!;
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF0F4FF), Color(0xFFE8F0FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CustomPaint(
        size: Size.infinite,
        painter: GridPainter(),
      ),
    );
  }

  Widget _legendItem(String name, Color color, int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3))),
          const SizedBox(width: 10),
          Text(name, style: const TextStyle(fontSize: 13)),
          const Spacer(),
          Text('$count masa', style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _hardwareBadge(String text, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: active ? const Color(0xFFDCFCE7) : const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: TextStyle(fontSize: 10, color: active ? const Color(0xFF166534) : Colors.grey)),
    );
  }

  Widget _detailField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  ButtonStyle _btnStyle(Color color) => ElevatedButton.styleFrom(
    backgroundColor: color,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );

  BoxDecoration _sidebarDeco() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
  );
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = const Color(0xFFE0E7FF)..strokeWidth = 1;
    for (double i = 0; i < size.width; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 50) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}