import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';

class RulesPage extends ConsumerStatefulWidget {
  const RulesPage({super.key});

  @override
  ConsumerState<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends ConsumerState<RulesPage> {
  // States
  bool _isLoading = false;
  String? _error;
  
  // React tarafındaki CreateRuleRequest yapısıyla aynı modelleme
  List<RuleModel> _rules = [
    RuleModel(
      id: '1', 
      name: 'NoShow Kuralı', 
      description: 'Gelmeyen kullanıcıların rezervasyonunu iptal et.', 
      ruleType: 'NoShow', 
      priority: 1, 
      isActive: true
    ),
    RuleModel(
      id: '2', 
      name: 'Kapasite Sınırı', 
      description: 'Ofis doluluk oranını %70 ile sınırla.', 
      ruleType: 'Capacity', 
      priority: 2, 
      isActive: true
    ),
    RuleModel(
      id: '3', 
      name: 'Haftalık Bildirim', 
      description: 'Her Pazartesi rapor gönder.', 
      ruleType: 'Notification', 
      priority: 5, 
      isActive: false
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return PermissionGuardWidget(
      requiredRoute: '/rules',
      child: AppLayout(
        currentRoute: '/rules',
        title: 'Kurallar',
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isMobile ? 16 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPageHeader(isMobile),
              const SizedBox(height: 32),
              _buildMainContent(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  // --- Header: Başlık ve Yeni Ekle Butonu ---
  Widget _buildPageHeader(bool isMobile) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 20,
      runSpacing: 20,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kurallar',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Sistem kurallarını yönetin.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () => _showRuleFormModal(),
          icon: const Icon(Icons.plus_one, size: 18),
          label: const Text('Yeni Kural'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F46E5),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 8,
            shadowColor: const Color(0xFF4F46E5).withOpacity(0.4),
          ),
        ),
      ],
    );
  }

  // --- Main Card: Tablo Alanı ---
  Widget _buildMainContent(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0).withOpacity(0.8)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1F2687).withOpacity(0.07),
            blurRadius: 32,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: _isLoading 
        ? const Center(child: Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator()))
        : _error != null 
          ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
          : _rules.isEmpty 
            ? const Center(child: Text('Kural bulunamadı', style: TextStyle(color: Colors.grey)))
            : isMobile ? _buildMobileList() : _buildDesktopTable(),
    );
  }

  // --- Desktop: React Table Görünümü ---
  Widget _buildDesktopTable() {
    return DataTable(
      horizontalMargin: 0,
      columnSpacing: 24,
      headingTextStyle: GoogleFonts.plusJakartaSans(
        fontWeight: FontWeight.bold,
        color: const Color(0xFF64748B),
        fontSize: 14,
      ),
      columns: const [
        DataColumn(label: Text('Kural Adı')),
        DataColumn(label: Text('Açıklama')),
        DataColumn(label: Text('Tür')),
        DataColumn(label: Text('Öncelik')),
        DataColumn(label: Text('Durum')),
        DataColumn(label: Text('İşlemler')),
      ],
      rows: _rules.map((rule) {
        return DataRow(cells: [
          DataCell(Row(
            children: [
              const Icon(Icons.shield_outlined, color: Color(0xFF6366F1), size: 18),
              const SizedBox(width: 8),
              Text(rule.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF312E81))),
            ],
          )),
          DataCell(Text(rule.description, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13))),
          DataCell(Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFFEEF2FF), borderRadius: BorderRadius.circular(6)),
            child: Text(rule.ruleType, style: const TextStyle(color: Color(0xFF312E81), fontWeight: FontWeight.bold, fontSize: 12)),
          )),
          DataCell(Text(rule.priority.toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6366F1)))),
          DataCell(_buildStatusBadge(rule.isActive)),
          DataCell(_buildActionButtons(rule)),
        ]);
      }).toList(),
    );
  }

  // --- Mobil: Kart Listesi ---
  Widget _buildMobileList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _rules.length,
      separatorBuilder: (_, __) => const Divider(height: 32),
      itemBuilder: (context, index) {
        final rule = _rules[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(rule.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                _buildStatusBadge(rule.isActive),
              ],
            ),
            const SizedBox(height: 8),
            Text(rule.description, style: const TextStyle(color: Color(0xFF64748B))),
            const SizedBox(height: 16),
            _buildActionButtons(rule),
          ],
        );
      },
    );
  }

  // --- Modal: Yeni Kural/Düzenle (React Modal Simülasyonu) ---
  void _showRuleFormModal({RuleModel? rule}) {
    final isEdit = rule != null;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(isEdit ? 'Kuralı Düzenle' : 'Yeni Kural Ekle', 
          style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
        content: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildModalTextField('Kural Adı', rule?.name),
              const SizedBox(height: 16),
              _buildModalTextField('Açıklama', rule?.description),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: rule?.ruleType ?? 'NoShow',
                decoration: const InputDecoration(labelText: 'Tür', border: OutlineInputBorder()),
                items: ['NoShow', 'Capacity', 'Pricing', 'Availability', 'Notification']
                    .map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (_) {},
              ),
              const SizedBox(height: 16),
              _buildModalTextField('Öncelik', rule?.priority.toString() ?? '1', isNumber: true),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  // --- Helpers ---
  Widget _buildModalTextField(String label, String? initialValue, {bool isNumber = false}) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
    );
  }

  Widget _buildStatusBadge(bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? 'Aktif' : 'Pasif',
        style: TextStyle(
          color: isActive ? const Color(0xFF166534) : const Color(0xFF991B1B),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButtons(RuleModel rule) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => _showRuleFormModal(rule: rule),
          icon: const Icon(Icons.edit_outlined, color: Color(0xFF312E81), size: 20),
        ),
        IconButton(
          onPressed: () => setState(() => _rules.removeWhere((r) => r.id == rule.id)),
          icon: const Icon(Icons.delete_outline, color: Color(0xFF991B1B), size: 20),
        ),
      ],
    );
  }
}

// Model
class RuleModel {
  final String id;
  final String name;
  final String description;
  final String ruleType;
  final int priority;
  final bool isActive;

  RuleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ruleType,
    required this.priority,
    required this.isActive,
  });
}