import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/common/common.dart';

class SupportPage extends ConsumerWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.support_agent, color: Colors.indigo, size: 48),
                const SizedBox(height: 16),
                Text('Destek ve Yardım', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Herhangi bir sorunla karşılaşırsanız veya yardım almak isterseniz aşağıdaki iletişim kanallarını kullanabilirsiniz.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.indigo[700], fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.indigo),
                    title: Text('E-posta ile destek'),
                    subtitle: Text('destek@ofis.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.indigo),
                    title: Text('Telefon ile destek'),
                    subtitle: Text('+90 555 123 45 67'),
                  ),
                  ListTile(
                    leading: Icon(Icons.chat, color: Colors.indigo),
                    title: Text('Canlı Sohbet'),
                    subtitle: Text('Hafta içi 09:00-18:00'),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
