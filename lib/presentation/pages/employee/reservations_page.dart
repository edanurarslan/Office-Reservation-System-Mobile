import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../application/providers/reservation_provider.dart';
import '../../../application/providers/auth_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/entities/reservation.dart';
import '../../../domain/entities/resource.dart';
import '../../widgets/common/common.dart';
import '../../widgets/common/reservation_create_form.dart';

class ReservationsPage extends ConsumerStatefulWidget {
  const ReservationsPage({super.key});

  @override
  ConsumerState<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends ConsumerState<ReservationsPage> {
  String _statusFilter = 'All';
  DateTime? _dateFilter;

  @override
  Widget build(BuildContext context) {
    final reservations = ref.watch(reservationProvider);
    
    final filteredReservations = reservations.where((r) {
      final statusMatch = _statusFilter == 'All' || 
          r.status.toString().split('.').last == _statusFilter;
      final dateMatch = _dateFilter == null || 
          (r.startsAt.year == _dateFilter!.year &&
           r.startsAt.month == _dateFilter!.month &&
           r.startsAt.day == _dateFilter!.day);
      return statusMatch && dateMatch;
    }).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: AppTheme.dashboardCard(),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _showReservationForm(context);
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          label: Text(
                            'Yeni Rezervasyon Oluştur',
                            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: AppTheme.dashboardCard(),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rezervasyon Geçmişi',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryIndigo,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceLight,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppTheme.surfaceBorder),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: DropdownButton<String>(
                              value: _statusFilter,
                              underline: const SizedBox(),
                              icon: const Icon(Icons.arrow_drop_down),
                              items: ['All', 'confirmed', 'pending', 'cancelled', 'checkedOut']
                                  .map((status) => DropdownMenuItem(
                                        value: status,
                                        child: Text(
                                          status == 'All' ? 'Tümü' : _getStatusText(status),
                                          style: GoogleFonts.inter(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _statusFilter = value!;
                                });
                              },
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final date = await showDatePicker(
                                context: context,
                                initialDate: _dateFilter ?? DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2030),
                              );
                              if (date != null) {
                                setState(() {
                                  _dateFilter = date;
                                });
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceLight,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppTheme.surfaceBorder),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.calendar_today, size: 16),
                                  const SizedBox(width: 8),
                                  Text(
                                    _dateFilter != null
                                        ? DateFormat('dd/MM/yyyy').format(_dateFilter!)
                                        : 'Tarih Seç',
                                    style: GoogleFonts.inter(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (_dateFilter != null)
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  _dateFilter = null;
                                });
                              },
                              tooltip: 'Filtreyi Temizle',
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      if (filteredReservations.isEmpty)
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                Icon(Icons.event_note, size: 64, color: AppTheme.textSecondary),
                                const SizedBox(height: 16),
                                Text(
                                  'Kriterlere uygun rezervasyon bulunamadı',
                                  style: GoogleFonts.inter(fontSize: 16, color: AppTheme.textSecondary),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredReservations.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 12),
                          itemBuilder: (context, index) {
                            return _ReservationCard(reservation: filteredReservations[index]);
                          },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }

  void _showReservationForm(BuildContext context) {
    final authState = ref.watch(authProvider);
    final userId = authState.user?.id ?? 'unknown';
    
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

  String _getStatusText(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return 'Beklemede';
      case 'confirmed':
        return 'Onaylandı';
      case 'cancelled':
        return 'İptal';
      case 'checkedout':
        return 'Tamamlandı';
      default:
        return status;
    }
  }
}

class _ReservationCard extends ConsumerWidget {
  final Reservation reservation;
  const _ReservationCard({required this.reservation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceBorder),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppTheme.primaryIndigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  reservation.resourceType == ResourceType.desk ? Icons.desk : Icons.meeting_room,
                  color: AppTheme.primaryIndigo,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reservation.resourceName,
                      style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 14, color: AppTheme.textSecondary),
                        const SizedBox(width: 4),
                        Text(
                          DateFormat('dd MMMM yyyy', 'tr_TR').format(reservation.startsAt),
                          style: GoogleFonts.inter(fontSize: 14, color: AppTheme.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: _getStatusColor(reservation.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _getStatusText(reservation.status),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _getStatusColor(reservation.status),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, size: 14, color: AppTheme.textSecondary),
                const SizedBox(width: 8),
                Text(
                  '${DateFormat('HH:mm').format(reservation.startsAt)} - ${DateFormat('HH:mm').format(reservation.endsAt)}',
                  style: GoogleFonts.inter(fontSize: 14, color: AppTheme.textSecondary),
                ),
              ],
            ),
          ),
          if (reservation.status == ReservationStatus.confirmed && reservation.startsAt.isAfter(DateTime.now()))
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Düzenleme özelliği yakında gelecek')),
                        );
                      },
                      icon: const Icon(Icons.edit_outlined, size: 16),
                      label: Text('Düzenle', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Rezervasyonu İptal Et', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                            content: Text('Bu rezervasyonu iptal etmek istediğinize emin misiniz?', style: GoogleFonts.inter()),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Hayır')),
                              TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Evet')),
                            ],
                          ),
                        );
                        if (confirm == true && context.mounted) {
                          ref.read(reservationProvider.notifier).cancelReservation(reservation.id);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Rezervasyon iptal edildi')));
                        }
                      },
                      icon: const Icon(Icons.cancel_outlined, size: 16),
                      label: Text('İptal Et', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
                      style: OutlinedButton.styleFrom(foregroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Color _getStatusColor(ReservationStatus status) {
    switch (status) {
      case ReservationStatus.pending:
        return Colors.orange;
      case ReservationStatus.confirmed:
        return Colors.green;
      case ReservationStatus.cancelled:
        return Colors.red;
      case ReservationStatus.checkedIn:
        return Colors.blue;
      case ReservationStatus.checkedOut:
        return Colors.grey;
      case ReservationStatus.noShow:
        return Colors.red;
      case ReservationStatus.expired:
        return Colors.grey;
    }
  }

  String _getStatusText(ReservationStatus status) {
    switch (status) {
      case ReservationStatus.pending:
        return 'Beklemede';
      case ReservationStatus.confirmed:
        return 'Onaylandı';
      case ReservationStatus.cancelled:
        return 'İptal';
      case ReservationStatus.checkedIn:
        return 'Giriş Yapıldı';
      case ReservationStatus.checkedOut:
        return 'Tamamlandı';
      case ReservationStatus.noShow:
        return 'Gelmedi';
      case ReservationStatus.expired:
        return 'Süresi Doldu';
    }
  }
}
