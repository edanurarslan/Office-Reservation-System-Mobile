import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'dart:async';
import '../../widgets/common/app_layout.dart'; // Bu yolun projenizde doğru olduğundan emin olun

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => QrPageState();
}

class QrPageState extends State<QrPage> {
  final TextEditingController _textController = TextEditingController();
  
  // Değişkenler
  String? _qrData;
  String? _scanResult;
  bool _showScanner = false;
  
  // Eksik olan değişken eklendi
  bool _showSuccess = false; 

  Timer? _qrTimer;
  int _qrSecondsLeft = 0;
  final int qrDuration = 30; // saniye

  @override
  void dispose() {
    _qrTimer?.cancel();
    _textController.dispose(); // Controller'ı da dispose etmek iyi bir pratiktir
    super.dispose();
  }

  void _startQrTimer() {
    _qrTimer?.cancel();
    setState(() {
      _qrSecondsLeft = qrDuration;
    });
    
    _qrTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_qrSecondsLeft <= 1) {
        timer.cancel();
        if (mounted) {
          setState(() {
            _qrData = null;
            _qrSecondsLeft = 0;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _qrSecondsLeft--;
          });
        }
      }
    });
  }

  void _showSuccessDialog() {
    setState(() {
      _showSuccess = true;
    });
    
    // Basit bir geri bildirim (Snackbar) gösterelim
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("İşlem Başarılı!"), duration: Duration(seconds: 2)),
    );

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _showSuccess = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView( // Klavye açıldığında taşma olmaması için eklendi
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showScanner)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 32),
                  const Text(
                    "QR Kodunu Tara", 
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 16),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final double boxSize = (constraints.maxWidth * 0.9).clamp(200.0, 400.0);
                      return SizedBox(
                          width: boxSize,
                          height: boxSize,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: MobileScanner(
                              fit: BoxFit.cover,
                              onDetect: (capture) {
                                final barcode = capture.barcodes.isNotEmpty ? capture.barcodes.first : null;
                                if (barcode == null || barcode.rawValue == null) return;
                                
                                setState(() {
                                  _scanResult = barcode.rawValue;
                                  _showScanner = false;
                                });
                                _showSuccessDialog();
                              },
                              errorBuilder: (context, error, child) => Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.error, color: Colors.red, size: 48),
                                    SizedBox(height: 8),
                                    Text(
                                      "Kamera açılamadı.\nİzinleri kontrol edin.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () => setState(() => _showScanner = false),
                      icon: const Icon(Icons.close),
                      label: const Text('Kapat'),
                    ),
                  ],
                )
              else ...[
                TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    labelText: 'QR için veri girin',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_textController.text.isEmpty) return;
                    setState(() {
                      _qrData = _textController.text;
                    });
                    _showSuccessDialog();
                    _startQrTimer();
                    // Klavye kapatmak için
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text('QR Oluştur'),
                ),
                const SizedBox(height: 24),
                
                if (_qrData != null && _qrData!.isNotEmpty)
                  Column(
                    children: [
                      QrImageView(
                        data: _qrData!,
                        version: QrVersions.auto,
                        size: 200,
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      if (_qrSecondsLeft > 0)
                        Text(
                          'Kalan süre: $_qrSecondsLeft sn', 
                          style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)
                        ),
                      if (_qrSecondsLeft == 0)
                        const Text('QR süresi doldu', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () => setState(() => _showScanner = true),
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('QR Kodunu Tara'),
                ),
                if (_scanResult != null)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Okunan veri: $_scanResult',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ),
      );
  }
}