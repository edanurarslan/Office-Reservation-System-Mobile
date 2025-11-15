import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';

class UnauthorizedPage extends StatelessWidget {
  final String? attemptedRoute;
  
  const UnauthorizedPage({
    super.key,
    this.attemptedRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surfaceLight,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lock Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red.shade400,
                      Colors.red.shade600,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_outline,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
              
              // Title
              Text(
                'Erişim Engellendi',
                style: GoogleFonts.inter(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              
              // Message
              Text(
                'Bu sayfaya erişim yetkiniz bulunmamaktadır.',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              if (attemptedRoute != null) ...[
                const SizedBox(height: 8),
                Text(
                  'Erişmeye çalıştığınız sayfa: $attemptedRoute',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppTheme.textTertiary,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 32),
              
              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Go Back Button
                  ElevatedButton.icon(
                    onPressed: () {
                      if (context.canPop()) {
                        context.pop();
                      } else {
                        context.go('/home');
                      }
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text('Geri Dön'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.surfaceBorder,
                      foregroundColor: AppTheme.textPrimary,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  
                  // Go Home Button
                  ElevatedButton.icon(
                    onPressed: () => context.go('/home'),
                    icon: const Icon(Icons.home),
                    label: const Text('Ana Sayfa'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryIndigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              
              // Help Text
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.amber.shade700,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Bu sayfaya erişmek için yönetici yetkisine ihtiyacınız var. Lütfen sistem yöneticinizle iletişime geçin.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.amber.shade900,
                        ),
                      ),
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
}
