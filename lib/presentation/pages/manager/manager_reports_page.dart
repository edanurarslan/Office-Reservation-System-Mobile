import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../widgets/common/common.dart';

class ManagerReportsPage extends ConsumerStatefulWidget {
  const ManagerReportsPage({super.key});

  @override
  ConsumerState<ManagerReportsPage> createState() => _ManagerReportsPageState();
}

class _ManagerReportsPageState extends ConsumerState<ManagerReportsPage> {
  // React: const [dateRange, setDateRange] = useState({ start: '2025-11-01', end: '2025-11-16' });
  DateTime _startDate = DateTime(2025, 11, 1);
  DateTime _endDate = DateTime(2025, 11, 16);

  // React: const reportStats = { ... }
  final Map<String, dynamic> _reportStats = {
    'totalReservations': 450,
    'avgOccupancy': 78,
    'peakHours': '14:00-16:00',
    'topLocation': 'A Bloğu - 1. Kat',
  };

  // React: const monthlyData = [ ... ]
  final List<Map<String, dynamic>> _monthlyData = [
    {'month': 'Kas', 'reservations': 340, 'occupancy': 75},
    {'month': 'Eki', 'reservations': 280, 'occupancy': 68},
    {'month': 'Eyl', 'reservations': 350, 'occupancy': 80},
    {'month': 'Ağu', 'reservations': 290, 'occupancy': 70},
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 700;

    return AppLayout(
      title: 'Raporlar',
      currentRoute: '/reports',
      child: SingleChildScrollView(
        padding: EdgeInsets.all(isMobile ? 16 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPageHeader(isMobile),
            const SizedBox(height: 32),
            _buildDateRangeFilters(isMobile),
            const SizedBox(height: 32),
            _buildStatsGrid(isMobile),
            const SizedBox(height: 32),
            _buildMonthlyTrendsCard(isMobile),
            const SizedBox(height: 32),
            _buildDownloadActions(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildPageHeader(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Raporlar',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Sistem kullanım istatistikleri ve raporları görüntüleyin.',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: const Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // --- Date Filters: React style grid ---
  Widget _buildDateRangeFilters(bool isMobile) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView.count(
        crossAxisCount: isMobile ? 1 : 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: isMobile ? 4 : 5,
        children: [
          _buildDateInput('Başlangıç Tarihi', _startDate, (d) => setState(() => _startDate = d!)),
          _buildDateInput('Bitiş Tarihi', _endDate, (d) => setState(() => _endDate = d!)),
        ],
      );
    });
  }

  Widget _buildDateInput(String label, DateTime date, Function(DateTime?) onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 14, fontWeight: FontWeight.w600, color: const Color(0xFF312E81))),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final picked = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2020), lastDate: DateTime(2030));
            onTap(picked);
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('yyyy-MM-dd').format(date), style: const TextStyle(fontSize: 14)),
                const Icon(Icons.calendar_today, size: 16, color: Color(0xFF64748B)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- Stat Cards: React style grid with Trends ---
  Widget _buildStatsGrid(bool isMobile) {
    return GridView.count(
      crossAxisCount: isMobile ? 1 : (MediaQuery.of(context).size.width > 1200 ? 4 : 2),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 1.8,
      children: [
        _buildStatCard("Toplam Rezervasyon", _reportStats['totalReservations'].toString(), Icons.calendar_today, Colors.blue, trend: "12%"),
        _buildStatCard("Ortalama Doluluk", "%${_reportStats['avgOccupancy']}", Icons.trending_up, Colors.green, trend: "5%"),
        _buildStatCard("En Yoğun Saat", _reportStats['peakHours'], Icons.bar_chart_outlined, Colors.orange),
        _buildStatCard("En Popüler Yer", _reportStats['topLocation'], Icons.trending_up, Colors.purple),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color, {String? trend}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: color, size: 24)),
              if (trend != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                  child: Text("+$trend", style: const TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          const Spacer(),
          Text(value, style: GoogleFonts.plusJakartaSans(fontSize: 22, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B))),
          Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 12, color: const Color(0xFF64748B), fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  // --- Monthly Trends: Dual Bar Chart ---
  Widget _buildMonthlyTrendsCard(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Aylık Trendler', style: GoogleFonts.plusJakartaSans(fontSize: 18, fontWeight: FontWeight.w700, color: const Color(0xFF312E81))),
          const SizedBox(height: 32),
          SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _monthlyData.reversed.map((data) => _buildDualBar(data)).toList(),
            ),
          ),
          const SizedBox(height: 24),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildDualBar(Map<String, dynamic> data) {
    double resH = (data['reservations'] / 400) * 150;
    double occH = (data['occupancy'] / 100) * 150;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _bar(resH, const [Color(0xFF6366F1), Color(0xFF818CF8)]),
            const SizedBox(width: 8),
            _bar(occH, const [Color(0xFF10B981), Color(0xFF34D399)]),
          ],
        ),
        const SizedBox(height: 12),
        Text(data['month'], style: GoogleFonts.plusJakartaSans(fontSize: 13, fontWeight: FontWeight.w600, color: const Color(0xFF312E81))),
      ],
    );
  }

  Widget _bar(double height, List<Color> colors) {
    return Container(
      width: 20,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _legendItem('Rezervasyon Sayısı', const Color(0xFF6366F1)),
        const SizedBox(width: 32),
        _legendItem('Doluluk Oranı', const Color(0xFF10B981)),
      ],
    );
  }

  Widget _legendItem(String text, Color color) {
    return Row(
      children: [
        Container(width: 12, height: 12, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4))),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(fontSize: 13, color: Color(0xFF6B7280))),
      ],
    );
  }

  // --- Export Buttons ---
  Widget _buildDownloadActions(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        _downloadButton('PDF Olarak İndir', const Color(0xFF4F46E5), Icons.download),
        _downloadButton('CSV Olarak İndir', const Color(0xFF10B981), Icons.download),
      ],
    );
  }

  Widget _downloadButton(String text, Color color, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF1F2687).withOpacity(0.1),
          blurRadius: 32,
          offset: const Offset(0, 8),
        )
      ],
      border: Border.all(color: const Color(0xFFE2E8F0).withOpacity(0.8)),
    );
  }
}