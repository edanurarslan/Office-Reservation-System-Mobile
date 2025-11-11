import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/app_layout.dart';
import '../widgets/permission_guard_widget.dart';

class RulesPage extends ConsumerStatefulWidget {
  const RulesPage({super.key});

  @override
  ConsumerState<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends ConsumerState<RulesPage> with PermissionCheckMixin {
  List<Rule> _rules = [
    Rule(id: 'r1', text: 'Ofiste maske takmak zorunludur.', type: RuleType.rule),
    Rule(id: 'r2', text: 'Cuma günü saat 17:00\'de temizlik yapılacaktır.', type: RuleType.announcement),
    Rule(id: 'r3', text: 'Rezervasyonlar en az 1 gün önceden yapılmalıdır.', type: RuleType.rule),
  ];

  @override
  Widget build(BuildContext context) {
    return PermissionGuardWidget(
      requiredRoute: '/rules',
      child: AppLayout(
        currentRoute: '/rules',
        title: 'Kurallar',
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kurallar ve Duyurular Yönetimi',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo[900],
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Rezervasyon ve ofis kullanım kurallarını, duyuruları ekleyin ve düzenleyin.',
                        style: TextStyle(color: Colors.indigo[600], fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Add Button
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () => _showRuleDialog(),
                  icon: const Icon(Icons.add),
                  label: const Text('Yeni Kural/Duyuru'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Rules Table
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    // Header
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.indigo[50],
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Text('Tip', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[700])),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text('Metin', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[700])),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text('Aksiyon', textAlign: TextAlign.right, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[700])),
                          ),
                        ],
                      ),
                    ),
                    
                    // Body
                    if (_rules.isEmpty)
                      Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text('Kural veya duyuru bulunamadı.', style: TextStyle(color: Colors.grey[500])),
                      )
                    else
                      ..._rules.map((rule) => Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Chip(
                                label: Text(rule.type == RuleType.rule ? 'Kural' : 'Duyuru'),
                                backgroundColor: rule.type == RuleType.rule ? Colors.blue[100] : Colors.orange[100],
                                labelStyle: TextStyle(
                                  color: rule.type == RuleType.rule ? Colors.blue[900] : Colors.orange[900],
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Expanded(flex: 4, child: Text(rule.text)),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, size: 20),
                                    color: Colors.indigo[600],
                                    onPressed: () => _showRuleDialog(rule: rule),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete, size: 20),
                                    color: Colors.red[600],
                                    onPressed: () => _deleteRule(rule),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRuleDialog({Rule? rule}) {
    final isEdit = rule != null;
    final textController = TextEditingController(text: rule?.text ?? '');
    RuleType selectedType = rule?.type ?? RuleType.rule;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(isEdit ? 'Kural/Duyuru Düzenle' : 'Yeni Kural/Duyuru Ekle'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField<RuleType>(
                value: selectedType,
                decoration: const InputDecoration(labelText: 'Tip'),
                items: const [
                  DropdownMenuItem(value: RuleType.rule, child: Text('Kural')),
                  DropdownMenuItem(value: RuleType.announcement, child: Text('Duyuru')),
                ],
                onChanged: (value) => setState(() => selectedType = value!),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: textController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Kural veya duyuru metni',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
            ElevatedButton(
              onPressed: () {
                if (textController.text.isEmpty) return;
                this.setState(() {
                  if (isEdit) {
                    final index = _rules.indexWhere((r) => r.id == rule.id);
                    _rules[index] = Rule(id: rule.id, text: textController.text, type: selectedType);
                  } else {
                    _rules.add(Rule(id: 'r${_rules.length + 1}', text: textController.text, type: selectedType));
                  }
                });
                Navigator.pop(context);
              },
              child: Text(isEdit ? 'Kaydet' : 'Ekle'),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteRule(Rule rule) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sil'),
        content: const Text('Kural/Duyuru silinsin mi?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('İptal')),
          ElevatedButton(
            onPressed: () {
              setState(() => _rules.removeWhere((r) => r.id == rule.id));
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Sil'),
          ),
        ],
      ),
    );
  }
}

enum RuleType { rule, announcement }

class Rule {
  final String id;
  final String text;
  final RuleType type;

  Rule({required this.id, required this.text, required this.type});
}
