import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/app_layout.dart';
import '../widgets/permission_guard_widget.dart';

class BackupPage extends ConsumerWidget {
  const BackupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PermissionGuardWidget(
      requiredRoute: '/backup',
      child: AppLayout(
        currentRoute: '/backup',
        title: 'Yedekleme',
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    children: [
                      Icon(Icons.backup, size: 64, color: Colors.indigo[300]),
                      const SizedBox(height: 16),
                      Text(
                        'Sistem Yedekleme',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Veritabanı ve dosyalarınızı yedekleyin veya geri yükleyin.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Yedekleme başlatıldı...')),
                          );
                        },
                        icon: const Icon(Icons.cloud_upload),
                        label: const Text('Yedekleme Başlat'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          backgroundColor: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Geri yükleme işlemi başlatıldı...')),
                          );
                        },
                        icon: const Icon(Icons.cloud_download),
                        label: const Text('Yedekten Geri Yükle'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.info_outline, color: Colors.blue),
                  title: const Text('Son Yedekleme'),
                  subtitle: const Text('11 Kasım 2025, 14:30'),
                  trailing: Chip(
                    label: const Text('Başarılı'),
                    backgroundColor: Colors.green[100],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
