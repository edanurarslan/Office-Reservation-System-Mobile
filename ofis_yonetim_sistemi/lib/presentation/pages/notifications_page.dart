import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/app_layout.dart';
import '../widgets/permission_guard_widget.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> 
    with PermissionCheckMixin {
  final TextEditingController _messageController = TextEditingController();
  final List<Recipient> _recipients = [
    Recipient(id: 'u1', name: 'Admin Kullanıcı', email: 'admin@ofis.com'),
    Recipient(id: 'u2', name: 'Ofis Kullanıcı', email: 'user@ofis.com'),
    Recipient(id: 'u3', name: 'Yönetici', email: 'manager@ofis.com'),
  ];
  final List<String> _selectedRecipients = [];
  bool _sent = false;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PermissionGuardWidget(
      requiredRoute: '/notifications',
      child: AppLayout(
        currentRoute: '/notifications',
        title: 'Bildirimler',
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Toplu Bildirim Gönder',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[900],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Kullanıcılara toplu bildirim veya duyuru gönderin.',
                    style: TextStyle(
                      color: Colors.indigo[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Message Input
                  TextField(
                    controller: _messageController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Bildirim veya Duyuru Metni',
                      hintText: 'Mesajınızı buraya yazın...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.indigo[50],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Recipients Header
                  Text(
                    'Alıcılar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Recipients Selection
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: _recipients.map((recipient) {
                      final isSelected = _selectedRecipients.contains(recipient.id);
                      return FilterChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isSelected ? Icons.check_circle : Icons.circle_outlined,
                              size: 18,
                              color: isSelected ? Colors.white : Colors.indigo[600],
                            ),
                            const SizedBox(width: 8),
                            Text(recipient.name),
                          ],
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            if (selected) {
                              _selectedRecipients.add(recipient.id);
                            } else {
                              _selectedRecipients.remove(recipient.id);
                            }
                          });
                        },
                        backgroundColor: Colors.indigo[50],
                        selectedColor: Colors.indigo[600],
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.indigo[700],
                          fontWeight: FontWeight.w500,
                        ),
                        checkmarkColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  // Send Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _sendNotification,
                      icon: const Icon(Icons.send),
                      label: const Text('Bildirimi Gönder'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  // Success Message
                  if (_sent) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green[300]!),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle, color: Colors.green[600]),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Bildirim başarıyla gönderildi!',
                              style: TextStyle(
                                color: Colors.green[700],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _sendNotification() {
    if (_messageController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen bir mesaj yazın!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (_selectedRecipients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lütfen en az bir alıcı seçin!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Simulate sending
    setState(() {
      _sent = true;
    });

    // Reset form after 2 seconds
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
}

// Model
class Recipient {
  final String id;
  final String name;
  final String email;

  Recipient({
    required this.id,
    required this.name,
    required this.email,
  });
}
