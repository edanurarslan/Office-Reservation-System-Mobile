import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/theme/app_theme.dart';
import '../../application/providers/auth_provider.dart';
import '../widgets/app_layout.dart';
import '../widgets/common/reservation_create_form.dart';

class ReservationsPage extends ConsumerWidget {
  const ReservationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final user = authState.user;

    return AppLayout(
      title: 'Rezervasyonlarım',
      child: Column(
        children: [
          // Yeni Rezervasyon Butonu
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: user != null
                    ? () => _showReservationForm(context, user.id)
                    : null,
                icon: const Icon(Icons.add_circle_outline),
                label: Text(
                  'Yeni Rezervasyon Oluştur',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          // Rezervasyon Listesi
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_note,
                    size: 80,
                    color: AppTheme.textSecondary.withOpacity(0.5),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Henüz Rezervasyonunuz Yok',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Yukarıdaki butonla yeni bir rezervasyon oluşturun',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: user != null
                        ? () => _showReservationForm(context, user.id)
                        : null,
                    icon: const Icon(Icons.add),
                    label: const Text('Rezervasyon Oluştur'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showReservationForm(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: ReservationCreateForm(
          userId: userId,
          onSuccess: () {
            Navigator.pop(context); // Dialogu kapat
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Rezervasyon başarıyla oluşturuldu!'),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
          },
        ),
      ),
    );
  }
}
