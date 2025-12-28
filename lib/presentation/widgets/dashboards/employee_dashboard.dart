import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../domain/entities/user.dart';

class EmployeeDashboard extends StatefulWidget {
  final User user;

  const EmployeeDashboard({super.key, required this.user});

  @override
  State<EmployeeDashboard> createState() => _EmployeeDashboardState();
}

class _EmployeeDashboardState extends State<EmployeeDashboard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(isMobile),
          const SizedBox(height: 32),
          _buildStatGrid(screenWidth),
          const SizedBox(height: 24),
          _buildMealCard(),
          const SizedBox(height: 24),
          _buildSideGrid(screenWidth),
        ],
      ),
    );
  }

  // --- Header: Karşılama ve Hızlı Butonlar ---
  Widget _buildHeader(bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 20,
      runSpacing: 20,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Merhaba, ',
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  TextSpan(
                    text: widget.user.firstName,
                    style: GoogleFonts.inter(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF4F46E5),
                    ),
                  ),
                  const TextSpan(text: ' 👋', style: TextStyle(fontSize: 32)),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'İşte bugün senin için ofisteki gelişmeler.',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIconButton(Icons.notifications_none_outlined),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white, size: 20),
              label: const Text('Hızlı Rezervasyon'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F46E5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                shadowColor: const Color(0xFF4F46E5).withOpacity(0.4),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- İstatistik Kartları ---
  Widget _buildStatGrid(double width) {
    return LayoutBuilder(builder: (context, constraints) {
      int crossCount = width < 600 ? 1 : 2;
      return GridView.count(
        crossAxisCount: crossCount,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: width < 600 ? 2.5 : 2.2,
        children: [
          _buildStatCard(
            'BUGÜNKÜ REZERVASYONLAR',
            '2',
            Icons.calendar_today,
            const Color(0xFF4F46E5),
            const Color(0xFFEEF2FF),
          ),
          _buildStatCard(
            'OFİS DOLULUK ORANI',
            '%64',
            Icons.trending_up,
            const Color(0xFF10B981),
            const Color(0xFFECFDF5),
            subtitle: 'Normal Seviye',
          ),
        ],
      );
    });
  }

  // --- Yemek Menüsü Kartı ---
  Widget _buildMealCard() {
    final meals = [
      {'day': 'Pazartesi', 'menu': 'Sebzeli Makarna, Salata', 'today': false},
      {'day': 'Salı', 'menu': 'Izgara Tavuk, Bulgur Pilavı', 'today': false},
      {'day': 'Çarşamba', 'menu': 'Balık, Garnitür, Salata', 'today': false},
      {'day': 'Perşembe', 'menu': 'Köfte, Patates, Yoğurt', 'today': false},
      {'day': 'Cuma', 'menu': 'Pizza, Mevsim Salata', 'today': true},
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: const Color(0xFFFEE2E2), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.restaurant, color: Color(0xFFF43F5E), size: 20),
                  ),
                  const SizedBox(width: 12),
                  Text('Haftalık Yemek Menüsü', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text('PDF İndir', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 20),
          ...meals.map((meal) => _buildMealItem(meal)),
        ],
      ),
    );
  }

  // --- Alt Üçlü Grid (Hava Durumu, Aktivite, Piyasa) ---
  Widget _buildSideGrid(double width) {
    bool isSmall = width < 900;
    return Column(
      children: [
        if (!isSmall)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildWeatherCard()),
              const SizedBox(width: 16),
              Expanded(child: _buildRecentActivity()),
              const SizedBox(width: 16),
              Expanded(child: _buildMarketCard()),
            ],
          )
        else ...[
          _buildWeatherCard(),
          const SizedBox(height: 16),
          _buildRecentActivity(),
          const SizedBox(height: 16),
          _buildMarketCard(),
        ]
      ],
    );
  }

  // --- YARDIMCI WIDGETLAR ---

  Widget _buildStatCard(String title, String value, IconData icon, Color color, Color bg, {String? subtitle}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w800, color: const Color(0xFF64748B), letterSpacing: 0.5)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(value, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF0F172A))),
                  if (subtitle != null) ...[
                    const SizedBox(width: 8),
                    Text(subtitle, style: GoogleFonts.inter(fontSize: 13, color: color, fontWeight: FontWeight.w600)),
                  ],
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMealItem(Map<String, dynamic> meal) {
    bool isToday = meal['today'] as bool;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade100))),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              meal['day'],
              style: TextStyle(
                fontWeight: isToday ? FontWeight.bold : FontWeight.w500,
                color: isToday ? Colors.indigo : Colors.grey.shade600,
              ),
            ),
          ),
          Expanded(child: Text(meal['menu'], style: const TextStyle(fontSize: 14))),
          if (isToday)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(6)),
              child: const Text('BUGÜN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.indigo)),
            ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF6366F1), Color(0xFF4F46E5)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: const [Icon(Icons.location_on, color: Colors.white70, size: 14), SizedBox(width: 4), Text('İSTANBUL', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold))]),
              const SizedBox(height: 8),
              const Text('21°C', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Parçalı Bulutlu', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
            ],
          ),
          const Icon(Icons.cloud_queue, color: Colors.white, size: 48),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: const [Icon(Icons.access_time, color: Colors.indigo, size: 16), SizedBox(width: 8), Text('Son Aktiviteler', style: TextStyle(fontWeight: FontWeight.bold))]),
          const SizedBox(height: 12),
          _activityItem('Ana Ofis - Masa 12', '27 Aralık, 2025'),
        ],
      ),
    );
  }

  Widget _buildMarketCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: const [Icon(Icons.trending_up, color: Colors.green, size: 16), SizedBox(width: 8), Text('Piyasalar', style: TextStyle(fontWeight: FontWeight.bold))]),
          const SizedBox(height: 12),
          _marketItem('USD/TRY', '32.10', '-0.12%', false),
          _marketItem('BIST 100', '9.120', '+1.45%', true),
        ],
      ),
    );
  }

  Widget _activityItem(String title, String date) {
    return Row(
      children: [
        Container(padding: const EdgeInsets.all(6), decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle), child: const Icon(Icons.calendar_month, size: 14)),
        const SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)), Text(date, style: TextStyle(fontSize: 11, color: Colors.grey.shade500))]),
      ],
    );
  }

  Widget _marketItem(String label, String value, String change, bool isUp) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
          Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
          Text(change, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: isUp ? Colors.green : Colors.red)),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE2E8F0)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4)]),
      child: IconButton(icon: Icon(icon, color: const Color(0xFF64748B)), onPressed: () {}),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFE2E8F0)),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
    );
  }
}