import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/providers/auth_provider.dart';
import '../../application/providers/reservation_provider.dart';
import '../../domain/entities/reservation.dart';

class ReservationsPage extends ConsumerWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final userReservations = ref.watch(userReservationsProvider(currentUser?.id ?? '1'));
    
    return Scaffold(
      appBar: AppBar(title: const Text('Rezervasyonlarım')),
      body: userReservations.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.event_busy, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Henüz rezervasyonunuz yok',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Kaynak rezervasyonu yapmak için ana sayfayı ziyaret edin'),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: userReservations.length,
              itemBuilder: (context, index) {
                final reservation = userReservations[index];
                return _ReservationCard(reservation: reservation);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to booking page
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Rezervasyon formu yakında gelecek')),
          );
        },
        child: const Icon(Icons.add),
        tooltip: 'Yeni Rezervasyon',
      ),
    );
  }
}

class _ReservationCard extends ConsumerWidget {
  final Reservation reservation;
  
  const _ReservationCard({required this.reservation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final isUpcoming = reservation.startsAt.isAfter(now);
    final isOngoing = reservation.startsAt.isBefore(now) && reservation.endsAt.isAfter(now);
    
    Color statusColor;
    String statusText;
    
    switch (reservation.status) {
      case ReservationStatus.confirmed:
        statusColor = isOngoing 
            ? Colors.green 
            : isUpcoming 
                ? Colors.blue 
                : Colors.grey;
        statusText = isOngoing 
            ? 'Devam Ediyor' 
            : isUpcoming 
                ? 'Onaylandı' 
                : 'Tamamlandı';
        break;
      case ReservationStatus.pending:
        statusColor = Colors.orange;
        statusText = 'Beklemede';
        break;
      case ReservationStatus.cancelled:
        statusColor = Colors.red;
        statusText = 'İptal Edildi';
        break;
      case ReservationStatus.checkedIn:
        statusColor = Colors.green;
        statusText = 'Check-in Yapıldı';
        break;
      case ReservationStatus.checkedOut:
        statusColor = Colors.grey;
        statusText = 'Tamamlandı';
        break;
      case ReservationStatus.expired:
        statusColor = Colors.red;
        statusText = 'Süresi Doldu';
        break;
      case ReservationStatus.noShow:
        statusColor = Colors.red;
        statusText = 'Gelmedi';
        break;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    reservation.resourceName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: statusColor),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${_formatDateTime(reservation.startsAt)} - ${_formatTime(reservation.endsAt)}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            if (reservation.notes != null) ...[
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.note, size: 16, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      reservation.notes!,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ],
            if (isUpcoming && reservation.status == ReservationStatus.confirmed) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // TODO: Cancel reservation
                      ref.read(reservationProvider.notifier).cancelReservation(reservation.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Rezervasyon iptal edildi')),
                      );
                    },
                    child: const Text('İptal Et'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Show QR code
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('QR kod özelliği yakında gelecek')),
                      );
                    },
                    icon: const Icon(Icons.qr_code, size: 16),
                    label: const Text('QR Kod'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    
    String dateStr;
    if (date == today) {
      dateStr = 'Bugün';
    } else if (date == tomorrow) {
      dateStr = 'Yarın';
    } else {
      dateStr = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
    
    return '$dateStr ${_formatTime(dateTime)}';
  }

  String _formatTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}