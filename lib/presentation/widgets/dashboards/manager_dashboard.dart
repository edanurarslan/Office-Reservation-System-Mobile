import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/user.dart';

class ManagerDashboard extends StatefulWidget {
  final User user;

  const ManagerDashboard({super.key, required this.user});

  @override
  State<ManagerDashboard> createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  // React'taki stats state'i gibi düşünebiliriz
  final bool _isLoading = false;
  final int _pendingApprovals = 3;
  final int _todayReservations = 12;

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
          
          // --- SARI BANNER (Pending Approvals Notification) ---
          if (_pendingApprovals > 0) ...[
            _buildPendingBanner(isMobile),
            const SizedBox(height: 24),
          ],

          // --- ANA İÇERİK KARTI (Beyaz Kart Yapısı) ---
          _buildMainContentCard(isMobile, screenWidth),
        ],
      ),
    );
  }

  // --- Header Bölümü ---
  Widget _buildHeader(bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yönetici Paneli',
              style: GoogleFonts.inter(
                fontSize: isMobile ? 24 : 32,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Rezervasyonlar, raporlar ve onay bekleyen işlemler.',
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 18),
          label: const Text('Yeni Rezervasyon'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4338CA),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            shadowColor: const Color(0xFF4338CA).withOpacity(0.3),
          ),
        ),
      ],
    );
  }

  // --- Onay Bekleyenler Banner (React'teki Sarı Gradient Yapı) ---
  Widget _buildPendingBanner(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFEF3C7), Color(0xFFFCD34D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFBBF24).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFFBBF24),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.access_time_filled, color: Color(0xFF92400E), size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$_pendingApprovals Onay Bekleyen İşlem',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF92400E),
                    fontSize: 17,
                  ),
                ),
                Text(
                  'İncelemeniz gereken bekleyen rezervasyon talepleri mevcut.',
                  style: GoogleFonts.inter(
                    color: const Color(0xFFB45309),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Ana Beyaz Kart ve İçindekiler ---
  Widget _buildMainContentCard(bool isMobile, double screenWidth) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
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
      child: Column(
        children: [
          // İstatistikler: Mobilde alt alta, Geniş ekranda yan yana
          if (screenWidth < 700) ...[
            _buildStatItem('Bugünkü Rezervasyonlar', '$_todayReservations', Icons.calendar_today, const Color(0xFF4338CA), const Color(0xFFE0E7FF)),
            const SizedBox(height: 16),
            _buildStatItem('Bekleyen Onaylar', '$_pendingApprovals', Icons.access_time, const Color(0xFFD97706), const Color(0xFFFEF3C7)),
          ] else
            Row(
              children: [
                Expanded(child: _buildStatItem('Bugünkü Rezervasyonlar', '$_todayReservations', Icons.calendar_today, const Color(0xFF4338CA), const Color(0xFFE0E7FF))),
                const SizedBox(width: 24),
                Expanded(child: _buildStatItem('Bekleyen Onaylar', '$_pendingApprovals', Icons.access_time, const Color(0xFFD97706), const Color(0xFFFEF3C7))),
              ],
            ),
          
          const SizedBox(height: 40),

          // Ortadaki Bilgi Alanı (Dashed Border Alanı)
          _buildOperationalOverview(),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, IconData icon, Color iconColor, Color bgColor) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(16)),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: GoogleFonts.inter(fontSize: 13, color: const Color(0xFF64748B), fontWeight: FontWeight.w500)),
              Text(value, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700, color: const Color(0xFF1E293B))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOperationalOverview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFF5F7FF), Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        // Custom Painter ile dashed border yapılabilir ama Container ile basitçe:
        border: Border.all(color: const Color(0xFFE2E8F0), width: 2, style: BorderStyle.solid), 
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))],
            ),
            child: const Icon(Icons.dashboard_outlined, color: Color(0xFF6366F1), size: 32),
          ),
          const SizedBox(height: 16),
          Text(
            _isLoading ? 'Veriler Hazırlanıyor...' : 'Operasyonel Genel Bakış',
            style: GoogleFonts.inter(color: const Color(0xFF312E81), fontWeight: FontWeight.w600, fontSize: 18),
          ),
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Text(
              'Sistem üzerindeki tüm rezervasyon trafiğini, doluluk oranlarını ve ekip bazlı raporları buradan takip edebilirsiniz.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: const Color(0xFF6B7280), fontSize: 15, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}