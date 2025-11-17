import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ofis_yonetim_sistemi/core/theme/app_theme.dart';

/// Generic empty state widget
class EmptyState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback? onRetry;
  final String? actionLabel;

  const EmptyState({
    Key? key,
    required this.title,
    this.subtitle,
    required this.icon,
    this.iconColor = const Color(0xFFB0B8D1),
    this.iconSize = 64,
    this.onRetry,
    this.actionLabel = 'Yeniden Dene',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: iconColor,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(actionLabel ?? 'Yeniden Dene'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Error state widget
class ErrorState extends StatelessWidget {
  final String title;
  final String? message;
  final String? errorCode;
  final VoidCallback? onRetry;
  final String? actionLabel;
  final IconData icon;
  final Color iconColor;

  const ErrorState({
    Key? key,
    required this.title,
    this.message,
    this.errorCode,
    this.onRetry,
    this.actionLabel = 'Yeniden Dene',
    this.icon = Icons.error_outline,
    this.iconColor = const Color(0xFFE53935),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 40,
                color: iconColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: 8),
              Text(
                message!,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppTheme.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (errorCode != null) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Hata: $errorCode',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: Text(actionLabel ?? 'Yeniden Dene'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// No results/No data found state
class NoResultsState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? searchQuery;
  final VoidCallback? onClear;

  const NoResultsState({
    Key? key,
    this.title = 'Sonuç Bulunamadı',
    this.subtitle,
    this.searchQuery,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: Icons.search_off,
      iconColor: Colors.amber[600]!,
      title: title,
      subtitle: subtitle ?? 
          (searchQuery != null 
            ? '"$searchQuery" için sonuç bulunamadı'
            : 'Gösterilecek veri yok'),
      onRetry: onClear,
      actionLabel: 'Filtreleri Temizle',
    );
  }
}

/// Connection error state
class ConnectionErrorState extends StatelessWidget {
  final VoidCallback onRetry;
  final String title;
  final String message;

  const ConnectionErrorState({
    Key? key,
    required this.onRetry,
    this.title = 'Bağlantı Hatası',
    this.message = 'İnternet bağlantınızı kontrol edin ve yeniden deneyin.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.wifi_off,
      iconColor: Colors.blue[600]!,
      title: title,
      message: message,
      onRetry: onRetry,
    );
  }
}

/// Server error state
class ServerErrorState extends StatelessWidget {
  final VoidCallback onRetry;
  final String? errorCode;

  const ServerErrorState({
    Key? key,
    required this.onRetry,
    this.errorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.cloud_off,
      iconColor: Colors.red[600]!,
      title: 'Sunucu Hatası',
      message: 'Sunucu geçici olarak kullanılamıyor. Lütfen daha sonra tekrar deneyin.',
      errorCode: errorCode,
      onRetry: onRetry,
    );
  }
}

/// Unauthorized state
class UnauthorizedState extends StatelessWidget {
  final VoidCallback onRetry;

  const UnauthorizedState({
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.lock_outline,
      iconColor: Colors.orange[600]!,
      title: 'Yetkisiz Erişim',
      message: 'Bu işlemi gerçekleştirmek için yetkiniz yok. Lütfen sistem yöneticisine başvurun.',
      onRetry: onRetry,
      actionLabel: 'Geri Dön',
    );
  }
}

/// Permission denied state
class PermissionDeniedState extends StatelessWidget {
  final String? permission;
  final VoidCallback onRetry;

  const PermissionDeniedState({
    Key? key,
    this.permission,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.block,
      iconColor: Colors.red[700]!,
      title: 'İzin Reddedildi',
      message: permission != null
          ? '$permission izni gerekli. Ayarlardan izin verin.'
          : 'Bu işlem için izin gerekli.',
      onRetry: onRetry,
      actionLabel: 'Ayarları Aç',
    );
  }
}

/// Timeout error state
class TimeoutErrorState extends StatelessWidget {
  final VoidCallback onRetry;

  const TimeoutErrorState({
    Key? key,
    required this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      icon: Icons.schedule,
      iconColor: Colors.amber[700]!,
      title: 'Bağlantı Zaman Aşımı',
      message: 'İstek çok uzun sürdü. Lütfen yeniden deneyin.',
      onRetry: onRetry,
    );
  }
}

/// General error fallback
class GeneralErrorState extends StatelessWidget {
  final String? message;
  final VoidCallback onRetry;
  final String? errorCode;

  const GeneralErrorState({
    Key? key,
    this.message,
    required this.onRetry,
    this.errorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      title: 'Bir Hata Oluştu',
      message: message ?? 'Beklenmeyen bir hata oluştu. Lütfen daha sonra tekrar deneyin.',
      errorCode: errorCode,
      onRetry: onRetry,
    );
  }
}
