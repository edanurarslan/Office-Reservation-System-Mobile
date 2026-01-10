import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/theme/app_theme.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // QR Code state
  String _qrData = '';
  bool _isQrActive = false;
  Timer? _refreshTimer;
  Timer? _countdownTimer;
  int _remainingSeconds = 30;
  static const int _qrValiditySeconds = 30;
  
  // Simulated user info (normalde auth provider'dan alınır)
  final String _userId = 'USR-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _refreshTimer?.cancel();
    _countdownTimer?.cancel();
    super.dispose();
  }

  String _generateQrData() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random().nextInt(999999).toString().padLeft(6, '0');
    final expiry = DateTime.now().add(const Duration(seconds: _qrValiditySeconds)).toIso8601String();
    
    // QR kod verisi: kullanıcı ID, timestamp, random token, expiry
    return 'OFIS|$_userId|$timestamp|$random|$expiry';
  }

  void _startQrCode() {
    setState(() {
      _isQrActive = true;
      _qrData = _generateQrData();
      _remainingSeconds = _qrValiditySeconds;
    });

    // Her saniye countdown güncelle
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      }
    });

    // Her 30 saniyede bir QR kodu yenile
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(const Duration(seconds: _qrValiditySeconds), (timer) {
      if (_isQrActive) {
        setState(() {
          _qrData = _generateQrData();
          _remainingSeconds = _qrValiditySeconds;
        });
      }
    });
  }

  void _stopQrCode() {
    _refreshTimer?.cancel();
    _countdownTimer?.cancel();
    setState(() {
      _isQrActive = false;
      _qrData = '';
      _remainingSeconds = _qrValiditySeconds;
    });
  }

  Color _getTimerColor() {
    if (_remainingSeconds > 20) return Colors.green;
    if (_remainingSeconds > 10) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              // Tab Bar
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.surfaceLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TabBar(
                  controller: _tabController,
                  labelColor: Colors.white,
                  unselectedLabelColor: AppTheme.textSecondary,
                  indicator: BoxDecoration(
                    color: AppTheme.primaryIndigo,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.qr_code, size: 20),
                          const SizedBox(width: 8),
                          Text('QR Kodum', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.qr_code_scanner, size: 20),
                          const SizedBox(width: 8),
                          Text('QR Tara', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Tab Content
              SizedBox(
                height: 600,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildMyQrTab(),
                    _buildScannerTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMyQrTab() {
    return Container(
      decoration: AppTheme.dashboardCard(),
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Text(
            'Kişisel QR Kodum',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Check-in/Check-out işlemleri için QR kodunuzu gösterin',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 32),
          
          // QR Code Display
          Expanded(
            child: _isQrActive ? _buildActiveQr() : _buildInactiveQr(),
          ),
          
          const SizedBox(height: 24),
          
          // Action Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _isQrActive ? _stopQrCode : _startQrCode,
              icon: Icon(_isQrActive ? Icons.stop : Icons.qr_code),
              label: Text(
                _isQrActive ? 'QR Kodu Durdur' : 'QR Kod Oluştur',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: _isQrActive ? Colors.red : AppTheme.primaryIndigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveQr() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Timer Circle
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 220,
                height: 220,
                child: CircularProgressIndicator(
                  value: _remainingSeconds / _qrValiditySeconds,
                  strokeWidth: 5,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(_getTimerColor()),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: QrImageView(
                  data: _qrData,
                  version: QrVersions.auto,
                  size: 160,
                  backgroundColor: Colors.white,
                eyeStyle: const QrEyeStyle(
                  eyeShape: QrEyeShape.square,
                  color: Color(0xFF1a1a2e),
                ),
                dataModuleStyle: const QrDataModuleStyle(
                  dataModuleShape: QrDataModuleShape.square,
                  color: Color(0xFF1a1a2e),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        
        // Timer Text
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _getTimerColor().withOpacity(0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: _getTimerColor().withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.timer, color: _getTimerColor(), size: 20),
              const SizedBox(width: 8),
              Text(
                '$_remainingSeconds saniye',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _getTimerColor(),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        
        // Info Text
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.autorenew, size: 16, color: AppTheme.textTertiary),
            const SizedBox(width: 4),
            Text(
              'Otomatik yenilenir',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppTheme.textTertiary,
              ),
            ),
          ],
        ),
      ],
      ),
    );
  }

  Widget _buildInactiveQr() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppTheme.surfaceLight,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Icon(
            Icons.qr_code_2,
            size: 120,
            color: AppTheme.textTertiary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'QR Kod Hazır',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Butona basarak kişisel QR kodunuzu oluşturun.\nQR kod ${_qrValiditySeconds} saniyede bir otomatik yenilenir.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildScannerTab() {
    return Container(
      decoration: AppTheme.dashboardCard(),
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.surfaceLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.qr_code_scanner,
              size: 100,
              color: AppTheme.primaryIndigo,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'QR Kod Tarayıcı',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'QR kod tarama özelliği mobil cihazlarda kullanılabilir.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Kamera erişimi gerektirir.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppTheme.textTertiary,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'QR tarayıcı yalnızca mobil cihazlarda çalışır',
                      style: GoogleFonts.inter(),
                    ),
                    backgroundColor: Colors.orange,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon: const Icon(Icons.camera_alt),
              label: Text(
                'Kamerayı Aç',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryIndigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}