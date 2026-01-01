import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/common/common.dart';

class ApprovalPage extends ConsumerStatefulWidget {
  const ApprovalPage({super.key});

  @override
  ConsumerState<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends ConsumerState<ApprovalPage> 
    with PermissionCheckMixin {
  List<ApprovalRequest> _approvals = [
    ApprovalRequest(
      id: 'a1',
      user: 'Ofis Kullanıcı',
      desk: 'A101',
      date: '2025-10-31',
      status: ApprovalStatus.pending,
    ),
    ApprovalRequest(
      id: 'a2',
      user: 'Yönetici',
      desk: 'B202',
      date: '2025-11-01',
      status: ApprovalStatus.pending,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PermissionGuardWidget(
      requiredRoute: '/approval',
      child: AppLayout(
        currentRoute: '/approval',
        title: 'Onay Bekleyenler',
        child: _buildContent(),
      ),
    );
  }

Widget _buildContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Ekran genişliği 800'den küçükse tablo 800px olsun (kaydırma açılır).
        // Ekran 800'den büyükse, tablo ekran genişliğine yayılsın (Expanded çalışır).
        final double minTableWidth = 800.0;
        final double contentWidth = constraints.maxWidth < minTableWidth
            ? minTableWidth
            : constraints.maxWidth;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          // DİKEY KAYDIRMA (Tüm sayfa için)
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
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
                      // --- Başlık Kısmı ---
                      Text(
                        'Rezervasyon Onay/İptal',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[900],
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Bekleyen rezervasyonları onaylayın veya reddedin.',
                        style: TextStyle(
                          color: Colors.indigo[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // --- Tablo Alanı ---
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // YATAY KAYDIRMA
                          physics: const ClampingScrollPhysics(), 
                          child: SizedBox(
                            // KRİTİK DÜZELTME: Tabloya kesin bir genişlik veriyoruz.
                            // Böylece Expanded widget'ları ne kadar yer kaplayacağını biliyor.
                            width: contentWidth, 
                            child: Column(
                              children: [
                                // --- Tablo Başlığı ---
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  color: Colors.indigo[50],
                                  child: Row(
                                    children: [
                                      _buildHeaderCell('Kullanıcı', flex: 3),
                                      _buildHeaderCell('Masa/Oda', flex: 2),
                                      _buildHeaderCell('Tarih', flex: 2),
                                      _buildHeaderCell('Durum', flex: 2),
                                      _buildHeaderCell('Aksiyon',
                                          flex: 4, align: TextAlign.right),
                                    ],
                                  ),
                                ),

                                // --- Tablo İçeriği ---
                                if (_approvals.isEmpty)
                                  Padding(
                                    padding: const EdgeInsets.all(40),
                                    child: Column(
                                      children: [
                                        Icon(Icons.check_circle_outline,
                                            size: 64, color: Colors.grey[300]),
                                        const SizedBox(height: 16),
                                        Text(
                                          'Bekleyen rezervasyon yok.',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  )
                                else
                                  ...List.generate(_approvals.length, (index) {
                                    final approval = _approvals[index];
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 12),
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color:
                                                index == _approvals.length - 1
                                                    ? Colors.transparent
                                                    : Colors.grey[200]!,
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              approval.user,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(approval.desk,
                                                style: const TextStyle(
                                                    color: Colors.black54)),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(approval.date,
                                                style: const TextStyle(
                                                    color: Colors.black54)),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: _buildStatusChip(
                                                    approval.status)),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (approval.status ==
                                                    ApprovalStatus.pending) ...[
                                                  ElevatedButton.icon(
                                                    onPressed: () =>
                                                        _approve(approval),
                                                    icon: const Icon(
                                                        Icons.check,
                                                        size: 14),
                                                    label: const Text('Onayla'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.green.shade600,
                                                      foregroundColor:
                                                          Colors.white,
                                                      elevation: 0,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 12,
                                                          vertical: 8),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  ElevatedButton.icon(
                                                    onPressed: () =>
                                                        _reject(approval),
                                                    icon: const Icon(
                                                        Icons.close,
                                                        size: 14),
                                                    label: const Text('Reddet'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.red.shade50,
                                                      foregroundColor:
                                                          Colors.red.shade700,
                                                      elevation: 0,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 12,
                                                          vertical: 8),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                    ),
                                                  ),
                                                ] else ...[
                                                  Text(
                                                    approval.status ==
                                                            ApprovalStatus
                                                                .approved
                                                        ? "Tamamlandı"
                                                        : "İptal Edildi",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade400,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Yardımcı Widget
  Widget _buildHeaderCell(String text,
      {required int flex, TextAlign align = TextAlign.left}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: align,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.indigo[900],
          fontSize: 13,
        ),
      ),
    );
  }
  
  Widget _buildStatusChip(ApprovalStatus status) {
    Color color;
    String label;
    IconData icon;

    switch (status) {
      case ApprovalStatus.pending:
        color = Colors.orange;
        label = 'Bekliyor';
        icon = Icons.pending;
        break;
      case ApprovalStatus.approved:
        color = Colors.green;
        label = 'Onaylandı';
        icon = Icons.check_circle;
        break;
      case ApprovalStatus.rejected:
        color = Colors.red;
        label = 'Reddedildi';
        icon = Icons.cancel;
        break;
    }

    return Chip(
      avatar: Icon(icon, color: Colors.white, size: 16),
      label: Text(label),
      backgroundColor: color,
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
    );
  }

  void _approve(ApprovalRequest approval) {
    setState(() {
      final index = _approvals.indexWhere((a) => a.id == approval.id);
      _approvals[index] = approval.copyWith(status: ApprovalStatus.approved);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${approval.user} rezervasyonu onaylandı!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _reject(ApprovalRequest approval) {
    setState(() {
      final index = _approvals.indexWhere((a) => a.id == approval.id);
      _approvals[index] = approval.copyWith(status: ApprovalStatus.rejected);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${approval.user} rezervasyonu reddedildi!'),
        backgroundColor: Colors.red,
      ),
    );
  }
}

// Models
enum ApprovalStatus { pending, approved, rejected }

class ApprovalRequest {
  final String id;
  final String user;
  final String desk;
  final String date;
  final ApprovalStatus status;

  ApprovalRequest({
    required this.id,
    required this.user,
    required this.desk,
    required this.date,
    required this.status,
  });

  ApprovalRequest copyWith({
    String? id,
    String? user,
    String? desk,
    String? date,
    ApprovalStatus? status,
  }) {
    return ApprovalRequest(
      id: id ?? this.id,
      user: user ?? this.user,
      desk: desk ?? this.desk,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }
}
