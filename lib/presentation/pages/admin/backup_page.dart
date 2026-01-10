import 'dart:io' as io; // Dosya işlemleri için
import 'package:flutter/foundation.dart'; // kIsWeb kontrolü için
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http; // API isteği için
import 'package:path_provider/path_provider.dart'; // Cihaz klasör erişimi için
// Web indirme desteği için
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../../../core/theme/app_theme.dart';
import '../../widgets/common/common.dart';

class BackupPage extends ConsumerStatefulWidget {
  const BackupPage({super.key});

  @override
  ConsumerState<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends ConsumerState<BackupPage> {
  String _status = '';
  bool _isDownloading = false;

  // React tarafındaki handleBackup mantığının Flutter karşılığı
  Future<void> _handleBackup() async {
    setState(() {
      _status = 'Yedekleme başlatıldı...';
      _isDownloading = true;
    });

    try {
  // Backend API URL'si (lokal geliştirme için)
  final response = await http.get(Uri.parse('http://localhost:5088/api/v1/backup'));

      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        
        // Content-Disposition'dan dosya adını ayıkla (React'teki mantık)
        String filename = 'yedek.json';
        final disposition = response.headers['content-disposition'];
        if (disposition != null && disposition.contains('filename=')) {
          filename = disposition.split('filename=')[1].replaceAll('"', '');
        }

        if (kIsWeb) {
          // --- WEB İÇİN İNDİRME ---
          final blob = html.Blob([bytes]);
          final url = html.Url.createObjectUrlFromBlob(blob);
          final anchor = html.AnchorElement(href: url)
            ..setAttribute("download", filename)
            ..click();
          html.Url.revokeObjectUrl(url);
        } else {
          // --- MOBİL/MASAÜSTÜ İÇİN DOSYA KAYDETME ---
          final directory = await getApplicationDocumentsDirectory();
          final file = io.File('${directory.path}/$filename');
          await file.writeAsBytes(bytes);
        }

        setState(() {
          _status = 'Yedekleme tamamlandı!';
          _isDownloading = false;
        });
      } else {
        throw Exception('Yedekleme başarısız');
      }
    } catch (e) {
      setState(() {
        _status = 'Yedekleme başarısız!';
        _isDownloading = false;
      });
    }
  }

  // Styles
  TextStyle _headingStyle() => GoogleFonts.plusJakartaSans(
    fontSize: 28, fontWeight: FontWeight.w800, color: const Color(0xFF1E293B));

  @override
  Widget build(BuildContext context) {
    return PermissionGuardWidget(
      requiredRoute: '/backup',
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 700),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 30, offset: const Offset(0, 10))
              ],
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Yedekleme ve Veri Dışa Aktarma', style: _headingStyle()),
                  const SizedBox(height: 12),
                  Text(
                    'Sisteminizi yedekleyin veya verileri dışa aktarın.',
                    style: GoogleFonts.plusJakartaSans(color: const Color(0xFF6366F1), fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(height: 32),
                  
                  // Buton Grubu
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      ElevatedButton.icon(
                        onPressed: _isDownloading ? null : _handleBackup,
                        icon: _isDownloading 
                          ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : const Icon(Icons.download_rounded),
                        label: const Text('Yedekleme Başlat'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                      ),
                    ],
                  ),

                  // Durum Mesajı (React'teki status div gibi)
                  if (_status.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: _status.contains('başarısız') ? const Color(0xFFFEF2F2) : const Color(0xFFF0FDF4),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              _status.contains('başarısız') ? Icons.error_outline : Icons.check_circle_outline,
                              color: _status.contains('başarısız') ? Colors.red : const Color(0xFF22C55E),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              _status,
                              style: GoogleFonts.plusJakartaSans(
                                color: _status.contains('başarısız') ? Colors.red : const Color(0xFF166534),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}