import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/common/common.dart';
import '../../../services/api_service.dart';
import '../../../infrastructure/providers/repository_providers.dart';

class RulesPage extends ConsumerStatefulWidget {
  const RulesPage({super.key});

  @override
  ConsumerState<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends ConsumerState<RulesPage> {
  final ApiService _apiService = ApiService();
  
  // States
  bool _isLoading = false;
  String? _error;
  List<RuleModel> _rules = [];

  @override
  void initState() {
    super.initState();
    _loadRules();
  }

  Future<String?> _getToken() async {
    final authRepository = ref.read(authRepositoryProvider);
    return await authRepository.getStoredToken();
  }

  Future<void> _loadRules() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final token = await _getToken();
      
      final rulesData = await _apiService.getRules(token: token);
      
      setState(() {
        _rules = rulesData.map((json) => RuleModel.fromJson(json)).toList();
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Kurallar yüklenirken hata oluştu: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _createRule(RuleModel rule) async {
    try {
      final token = await _getToken();
      
      await _apiService.createRule(
        name: rule.name,
        description: rule.description,
        ruleType: rule.ruleType,
        priority: rule.priority,
        isActive: rule.isActive,
        configuration: rule.configuration,
        token: token,
      );
      
      await _loadRules();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kural başarıyla oluşturuldu'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kural oluşturulurken hata: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _updateRule(RuleModel rule) async {
    try {
      final token = await _getToken();
      
      await _apiService.updateRule(
        id: rule.id,
        name: rule.name,
        description: rule.description,
        priority: rule.priority,
        isActive: rule.isActive,
        configuration: rule.configuration,
        token: token,
      );
      
      await _loadRules();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kural başarıyla güncellendi'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kural güncellenirken hata: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _deleteRule(String id) async {
    try {
      final token = await _getToken();
      
      await _apiService.deleteRule(id: id, token: token);
      
      await _loadRules();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kural başarıyla silindi'), backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Kural silinirken hata: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _toggleRuleStatus(RuleModel rule) async {
    try {
      final token = await _getToken();
      
      await _apiService.toggleRuleStatus(
        id: rule.id,
        isActive: !rule.isActive,
        token: token,
      );
      
      await _loadRules();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Durum güncellenirken hata: $e'), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return PermissionGuardWidget(
      requiredRoute: '/rules',
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
    final nameController = TextEditingController(text: rule?.name ?? '');
    final descController = TextEditingController(text: rule?.description ?? '');
    final priorityController = TextEditingController(text: rule?.priority.toString() ?? '1');
    String selectedType = rule?.ruleType ?? 'Capacity';
    
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(isEdit ? 'Kuralı Düzenle' : 'Yeni Kural Ekle', 
            style: GoogleFonts.plusJakartaSans(fontWeight: FontWeight.bold)),
          content: SizedBox(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Kural Adı', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: 'Açıklama', border: OutlineInputBorder()),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedType,
                  decoration: const InputDecoration(labelText: 'Tür', border: OutlineInputBorder()),
                  items: ['Capacity', 'NoShow', 'WorkingHours', 'Pricing', 'Availability', 'Notification']
                      .map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                  onChanged: (val) => setModalState(() => selectedType = val ?? 'Capacity'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: priorityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Öncelik', border: OutlineInputBorder()),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                
                final newRule = RuleModel(
                  id: rule?.id ?? '',
                  name: nameController.text,
                  description: descController.text,
                  ruleType: selectedType,
                  priority: int.tryParse(priorityController.text) ?? 1,
                  isActive: rule?.isActive ?? true,
                );
                
                if (isEdit) {
                  await _updateRule(newRule);
                } else {
                  await _createRule(newRule);
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white),
              child: const Text('Kaydet'),
            ),
          ],
        ),
      ),
    );
  }

  // --- Helpers ---
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
          onPressed: () => _toggleRuleStatus(rule),
          icon: Icon(
            rule.isActive ? Icons.pause_circle_outline : Icons.play_circle_outline,
            color: rule.isActive ? Colors.orange : Colors.green,
            size: 20,
          ),
          tooltip: rule.isActive ? 'Pasif Yap' : 'Aktif Yap',
        ),
        IconButton(
          onPressed: () => _showRuleFormModal(rule: rule),
          icon: const Icon(Icons.edit_outlined, color: Color(0xFF312E81), size: 20),
        ),
        IconButton(
          onPressed: () => _confirmDelete(rule),
          icon: const Icon(Icons.delete_outline, color: Color(0xFF991B1B), size: 20),
        ),
      ],
    );
  }

  void _confirmDelete(RuleModel rule) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kuralı Sil'),
        content: Text('"${rule.name}" kuralını silmek istediğinize emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteRule(rule.id);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Sil', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
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
  final String? configuration;
  final DateTime? validFrom;
  final DateTime? validUntil;

  RuleModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ruleType,
    required this.priority,
    required this.isActive,
    this.configuration,
    this.validFrom,
    this.validUntil,
  });

  factory RuleModel.fromJson(Map<String, dynamic> json) {
    return RuleModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      ruleType: json['type']?.toString() ?? json['ruleType']?.toString() ?? 'Unknown',
      priority: json['priority'] as int? ?? 1,
      isActive: json['isActive'] as bool? ?? true,
      configuration: json['configuration']?.toString(),
      validFrom: json['validFrom'] != null ? DateTime.tryParse(json['validFrom'].toString()) : null,
      validUntil: json['validUntil'] != null ? DateTime.tryParse(json['validUntil'].toString()) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'type': ruleType,
      'priority': priority,
      'isActive': isActive,
      'configuration': configuration,
      'validFrom': validFrom?.toIso8601String(),
      'validUntil': validUntil?.toIso8601String(),
    };
  }
}