import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';
import '../../../core/theme/app_theme.dart';

class ManagerNotificationsPage extends ConsumerStatefulWidget {
  const ManagerNotificationsPage({super.key});

  @override
  ConsumerState<ManagerNotificationsPage> createState() => _ManagerNotificationsPageState();
}

class _ManagerNotificationsPageState extends ConsumerState<ManagerNotificationsPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _recipients = [
    {'id': 'u1', 'name': 'Ofis Kullanıcı', 'email': 'user@ofis.com'},
    {'id': 'u2', 'name': 'Yönetici', 'email': 'manager@ofis.com'},
    {'id': 'u3', 'name': 'Admin', 'email': 'admin@ofis.com'},
  ];

  final Set<String> _selectedRecipients = {};
  bool _sent = false;

  void _toggleRecipient(String id) {
    setState(() {
      if (_selectedRecipients.contains(id)) {
        _selectedRecipients.remove(id);
      } else {
        _selectedRecipients.add(id);
      }
    });
  }

  void _handleSend() {
    if (_messageController.text.isEmpty || _selectedRecipients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Lütfen mesaj girin ve en az bir alıcı seçin',
            style: GoogleFonts.inter(),
          ),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _sent = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _sent = false;
          _messageController.clear();
          _selectedRecipients.clear();
        });
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      title: 'Manager Notifications',
      currentRoute: '/manager-notifications',
      child: PermissionGuardWidget(
        requiredRoute: '/manager-notifications',
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Text(
                    'Toplu Bildirim Gönder',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Kullanıcılara toplu bildirim veya duyuru gönderin.',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.primaryIndigo,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Message Input
                  Container(
                    decoration: AppTheme.glassCard(),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bildirim Metni',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _messageController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Bildirim veya duyuru metni',
                            hintStyle: GoogleFonts.inter(
                              color: AppTheme.textTertiary,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppTheme.surfaceBorder),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppTheme.surfaceBorder),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppTheme.primaryIndigo, width: 2),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Recipients
                        Text(
                          'Alıcılar',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: _recipients.map((recipient) {
                            final isSelected = _selectedRecipients.contains(recipient['id']);
                            return InkWell(
                              onTap: () => _toggleRecipient(recipient['id']!),
                              borderRadius: BorderRadius.circular(24),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? LinearGradient(
                                          colors: [
                                            AppTheme.primaryIndigo,
                                            AppTheme.accentIndigo,
                                          ],
                                        )
                                      : null,
                                  color: isSelected ? null : AppTheme.primaryIndigo.withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      isSelected ? Icons.check_circle : Icons.circle_outlined,
                                      size: 18,
                                      color: isSelected ? Colors.white : AppTheme.primaryIndigo,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      recipient['name']!,
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: isSelected ? Colors.white : AppTheme.primaryIndigo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 24),

                        // Send Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleSend,
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: AppTheme.primaryIndigo,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.send, size: 20),
                                const SizedBox(width: 8),
                                Text(
                                  'Bildirimi Gönder',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Success Message
                        if (_sent)
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_circle, color: Colors.green),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Bildirim başarıyla gönderildi!',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
