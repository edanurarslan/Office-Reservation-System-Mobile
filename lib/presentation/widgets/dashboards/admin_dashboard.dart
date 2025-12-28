import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/user.dart';

class AdminDashboard extends StatefulWidget {
  final User user;
  const AdminDashboard({super.key, required this.user});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() => _currentTime = DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.all(isMobile ? 20 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(isMobile),
          const SizedBox(height: 32),
          _buildStatsGrid(screenWidth),
          const SizedBox(height: 32),
          if (isMobile) ...[
            _buildQuickActions(screenWidth),
            const SizedBox(height: 24),
            _buildSystemStatus(),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildQuickActions(screenWidth)),
                const SizedBox(width: 24),
                Expanded(flex: 2, child: _buildSystemStatus()),
              ],
            ),
          const SizedBox(height: 32),
          _buildActivityTimeline(),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoş Geldiniz, Admin 👋',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: isMobile ? 24 : 32,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat('EEEE, d MMMM yyyy', 'tr_TR').format(_currentTime),
                style: GoogleFonts.plusJakartaSans(
                  color: const Color(0xFF64748B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        if (!isMobile) _buildLiveClock(),
      ],
    );
  }

  Widget _buildLiveClock() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10)
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.timer_outlined, color: Color(0xFF6366F1), size: 20),
          const SizedBox(width: 10),
          Text(
            DateFormat('HH:mm:ss').format(_currentTime),
            style: GoogleFonts.jetBrainsMono(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E293B),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(double width) {
    final stats = [
      {'t': 'Toplam Kullanıcı', 'v': '1,284', 'i': Icons.people_outline, 'c': Colors.blue},
      {'t': 'Aktif Oturum', 'v': '432', 'i': Icons.bolt, 'c': Colors.amber},
      {'t': 'Onay Bekleyen', 'v': '12', 'i': Icons.pending_outlined, 'c': Colors.pink},
      {'t': 'Sistem Sağlığı', 'v': '%99.8', 'i': Icons.shutter_speed, 'c': Colors.green},
    ];

    int crossCount = width < 600 ? 2 : (width < 1200 ? 2 : 4);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 100,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final s = stats[index];
        return _buildModernStatCard(
            s['t'] as String, s['v'] as String, s['i'] as IconData, s['c'] as Color);
      },
    );
  }

  Widget _buildModernStatCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 11, color: const Color(0xFF64748B), fontWeight: FontWeight.w600)),
                Text(value, style: GoogleFonts.plusJakartaSans(fontSize: 20, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(double width) {
    final actions = [
      {'n': 'Kullanıcılar', 'i': Icons.group_add_outlined, 'c': Color(0xFF4F46E5)},
      {'n': 'Ayarlar', 'i': Icons.settings_outlined, 'c': Color(0xFF0EA5E9)},
      {'n': 'Raporlar', 'i': Icons.bar_chart_outlined, 'c': Color(0xFF8B5CF6)},
      {'n': 'Güvenlik', 'i': Icons.shield_outlined, 'c': Color(0xFFF43F5E)},
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Hızlı İşlemler', Icons.auto_awesome_outlined),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 80,
            ),
            itemCount: actions.length,
            itemBuilder: (context, index) {
              final a = actions[index];
              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: (a['c'] as Color).withOpacity(0.03),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: (a['c'] as Color).withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      Icon(a['i'] as IconData, color: a['c'] as Color, size: 22),
                      const SizedBox(width: 12),
                      Text(a['n'] as String, style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.w700, fontSize: 13)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSystemStatus() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Sistem Durumu', Icons.dns_outlined),
          const SizedBox(height: 20),
          _statusRow('Sunucu Yükü', '%24', 0.24, Colors.blue),
          const SizedBox(height: 16),
          _statusRow('Hafıza Kullanımı', '%68', 0.68, Colors.orange),
        ],
      ),
    );
  }

  Widget _statusRow(String label, String value, double progress, Color color) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 13, fontWeight: FontWeight.w600)),
            Text(value, style: GoogleFonts.jetBrainsMono(fontSize: 13, fontWeight: FontWeight.w700, color: color)),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: color.withOpacity(0.1),
          color: color,
          borderRadius: BorderRadius.circular(10),
          minHeight: 6,
        ),
      ],
    );
  }

  Widget _buildActivityTimeline() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Son Aktiviteler', Icons.history_toggle_off),
          const SizedBox(height: 20),
          ...List.generate(3, (i) => _buildActivityItem(i)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const CircleAvatar(radius: 4, backgroundColor: Color(0xFF6366F1)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Admin tarafından yeni bir konum eklendi: Maslak Ofis',
              style: GoogleFonts.plusJakartaSans(fontSize: 13, color: const Color(0xFF334155)),
            ),
          ),
          Text('12:4$index', style: GoogleFonts.plusJakartaSans(fontSize: 12, color: const Color(0xFF94A3B8))),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 20, color: const Color(0xFF1E293B)),
        const SizedBox(width: 10),
        Text(title, style: GoogleFonts.plusJakartaSans(fontSize: 16, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B))),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFE2E8F0)),
      boxShadow: [
        BoxShadow(color: const Color(0xFF0F172A).withOpacity(0.04), blurRadius: 16, offset: const Offset(0, 8)),
      ],
    );
  }
}