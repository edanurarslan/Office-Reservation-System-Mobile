import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import '../../core/theme/app_theme.dart';
import '../../application/providers/auth_provider.dart';
import '../../application/providers/reservation_provider.dart';
import '../widgets/app_layout.dart';

class ApiTestPage extends ConsumerStatefulWidget {
  const ApiTestPage({super.key});

  @override
  ConsumerState<ApiTestPage> createState() => _ApiTestPageState();
}

class _ApiTestPageState extends ConsumerState<ApiTestPage> {
  String _selectedEndpoint = 'auth/login';
  String _requestBody = '';
  String _response = '';
  bool _isLoading = false;
  String _statusCode = '';
  
  final Map<String, Map<String, dynamic>> _endpoints = {
    'auth/login': {
      'method': 'POST',
      'path': '/api/auth/login',
      'body': {
        'email': 'admin@test.com',
        'password': 'Test123!'
      },
      'description': 'Kullanıcı girişi yapar',
    },
    'auth/refresh': {
      'method': 'POST',
      'path': '/api/auth/refresh',
      'body': {
        'refreshToken': 'your-refresh-token-here'
      },
      'description': 'Access token\'ı yeniler',
    },
    'reservations/list': {
      'method': 'GET',
      'path': '/api/reservations',
      'body': null,
      'description': 'Tüm rezervasyonları listeler',
    },
    'reservations/create': {
      'method': 'POST',
      'path': '/api/reservations',
      'body': {
        'resourceType': 'Desk',
        'resourceId': '3fa85f64-5717-4562-b3fc-2c963f66afa6',
        'startsAt': '2024-11-11T09:00:00Z',
        'endsAt': '2024-11-11T17:00:00Z',
      },
      'description': 'Yeni rezervasyon oluşturur',
    },
    'reservations/cancel': {
      'method': 'DELETE',
      'path': '/api/reservations/{id}',
      'body': null,
      'description': 'Rezervasyonu iptal eder',
    },
    'users/me': {
      'method': 'GET',
      'path': '/api/users/me',
      'body': null,
      'description': 'Mevcut kullanıcı bilgilerini getirir',
    },
  };

  @override
  void initState() {
    super.initState();
    _updateRequestBody();
  }

  void _updateRequestBody() {
    final endpoint = _endpoints[_selectedEndpoint]!;
    if (endpoint['body'] != null) {
      _requestBody = JsonEncoder.withIndent('  ').convert(endpoint['body']);
    } else {
      _requestBody = '';
    }
    setState(() {});
  }

  Future<void> _testEndpoint() async {
    setState(() {
      _isLoading = true;
      _response = '';
      _statusCode = '';
    });

    try {
      final endpoint = _endpoints[_selectedEndpoint]!;
      final method = endpoint['method'] as String;
      final path = endpoint['path'] as String;
      
      dynamic result;
      int statusCode = 200;
      
      // Simulate API call based on method
      if (method == 'POST' && path.contains('login')) {
        // Test login
        final authNotifier = ref.read(authProvider.notifier);
        final body = jsonDecode(_requestBody);
        await authNotifier.login(body['email'], body['password']);
        result = {'message': 'Login successful', 'user': ref.read(authProvider).user?.email};
        statusCode = 200;
      } else if (method == 'GET' && path.contains('reservations')) {
        // Test get reservations
        final reservations = ref.read(reservationProvider);
        result = {'count': reservations.length, 'reservations': reservations.map((r) => r.toString()).toList()};
        statusCode = 200;
      } else {
        result = {
          'message': 'Bu endpoint henüz implement edilmedi',
          'endpoint': path,
          'method': method,
          'note': 'API client üzerinden gerçek istek atılacak'
        };
      }

      setState(() {
        _response = JsonEncoder.withIndent('  ').convert({
          'success': true,
          'data': result.toString(),
        });
        _statusCode = '✅ $statusCode OK';
      });
    } catch (e) {
      setState(() {
        _response = JsonEncoder.withIndent('  ').convert({
          'success': false,
          'error': e.toString(),
        });
        _statusCode = '❌ Error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final endpoint = _endpoints[_selectedEndpoint]!;
    
    return AppLayout(
      currentRoute: '/api-test',
      title: 'API Test Console',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade600, Colors.purple.shade800],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.bug_report, color: Colors.white, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'API Test Console',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      Text(
                        'Backend API endpoint\'lerini test edin',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Panel - Request
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('REQUEST', Icons.arrow_upward, Colors.blue),
                      const SizedBox(height: 16),
                      
                      // Endpoint Selector
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.surfaceBorder),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Endpoint',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: _selectedEndpoint,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              ),
                              items: _endpoints.keys.map((key) {
                                final ep = _endpoints[key]!;
                                return DropdownMenuItem(
                                  value: key,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: _getMethodColor(ep['method']),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          ep['method'],
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        ep['path'],
                                        style: GoogleFonts.robotoMono(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedEndpoint = value!;
                                  _updateRequestBody();
                                });
                              },
                            ),
                            const SizedBox(height: 12),
                            Text(
                              endpoint['description'],
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: AppTheme.textTertiary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Request Body
                      if (endpoint['body'] != null) ...[
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.surfaceBorder),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Request Body (JSON)',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: TextEditingController(text: _requestBody),
                                maxLines: 12,
                                style: GoogleFonts.robotoMono(fontSize: 13),
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.grey.shade50,
                                ),
                                onChanged: (value) => _requestBody = value,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      
                      // Send Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: _isLoading ? null : _testEndpoint,
                          icon: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                                )
                              : const Icon(Icons.send),
                          label: Text(_isLoading ? 'Gönderiliyor...' : 'İsteği Gönder'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryIndigo,
                            foregroundColor: Colors.white,
                            textStyle: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(width: 24),
                
                // Right Panel - Response
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle('RESPONSE', Icons.arrow_downward, Colors.green),
                      const SizedBox(height: 16),
                      
                      // Status Code
                      if (_statusCode.isNotEmpty) ...[
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: _statusCode.contains('✅') ? Colors.green.shade50 : Colors.red.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: _statusCode.contains('✅') ? Colors.green.shade200 : Colors.red.shade200,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                _statusCode.contains('✅') ? Icons.check_circle : Icons.error,
                                color: _statusCode.contains('✅') ? Colors.green.shade700 : Colors.red.shade700,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                _statusCode,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: _statusCode.contains('✅') ? Colors.green.shade900 : Colors.red.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      
                      // Response Body
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppTheme.surfaceBorder),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Response Body',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppTheme.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              height: 400,
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade900,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SingleChildScrollView(
                                child: SelectableText(
                                  _response.isEmpty ? '// Response will appear here...' : _response,
                                  style: GoogleFonts.robotoMono(
                                    fontSize: 13,
                                    color: _response.isEmpty ? Colors.grey.shade600 : Colors.green.shade300,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 32),
            
            // Info Box
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, color: Colors.blue.shade700, size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'API Test Notları',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade900,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '• Backend API localhost:5088 adresinde çalışıyor olmalı\n'
                          '• Mock mode aktifken gerçek API çağrıları yapılmaz\n'
                          '• Token authentication otomatik olarak eklenir\n'
                          '• Hataları Console\'dan da kontrol edebilirsiniz',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.blue.shade800,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
      ],
    );
  }

  Color _getMethodColor(String method) {
    switch (method) {
      case 'GET':
        return Colors.blue;
      case 'POST':
        return Colors.green;
      case 'PUT':
        return Colors.orange;
      case 'DELETE':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
