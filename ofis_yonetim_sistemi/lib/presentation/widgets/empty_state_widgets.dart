import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Empty state widget with illustration and message
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? action;
  final Color? iconColor;

  const EmptyState({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.action,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: iconColor ?? Colors.grey[400],
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle!,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey[500],
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null) ...[
              const SizedBox(height: 24),
              action!,
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
  final VoidCallback? onRetry;
  final IconData icon;

  const ErrorState({
    Key? key,
    required this.title,
    this.message,
    this.onRetry,
    this.icon = Icons.error_outline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 40,
                  color: Colors.red[600],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
                textAlign: TextAlign.center,
              ),
              if (message != null) ...[
                const SizedBox(height: 8),
                Text(
                  message!,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              if (onRetry != null) ...[
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Yeniden Dene'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    backgroundColor: Colors.red[600],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Connection error state
class ConnectionError extends StatelessWidget {
  final VoidCallback? onRetry;

  const ConnectionError({
    Key? key,
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      title: 'Bağlantı Hatası',
      message: 'İnternet bağlantısını kontrol edin ve tekrar deneyin.',
      icon: Icons.wifi_off,
      onRetry: onRetry,
    );
  }
}

/// Server error state
class ServerError extends StatelessWidget {
  final VoidCallback? onRetry;
  final String? errorCode;

  const ServerError({
    Key? key,
    this.onRetry,
    this.errorCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErrorState(
      title: 'Sunucu Hatası',
      message: errorCode != null
          ? 'Bir hata oluştu. Hata Kodu: $errorCode'
          : 'Sunucu ile iletişim kurulamıyor. Lütfen tekrar deneyin.',
      icon: Icons.cloud_off,
      onRetry: onRetry,
    );
  }
}

/// No data available state
class NoDataState extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Widget? action;

  const NoDataState({
    Key? key,
    required this.title,
    this.subtitle,
    this.icon = Icons.inbox_outlined,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: icon,
      title: title,
      subtitle: subtitle,
      action: action,
      iconColor: Colors.blue[300],
    );
  }
}

/// Permission denied state
class PermissionDeniedState extends StatelessWidget {
  final String? message;
  final VoidCallback? onBack;

  const PermissionDeniedState({
    Key? key,
    this.message,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lock_outline,
                  size: 40,
                  color: Colors.amber[700],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Erişim Reddedildi',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                message ?? 'Bu sayfaya erişim izniniz bulunmamaktadır.',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
              if (onBack != null) ...[
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: onBack,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Geri Dön'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// State with conditional rendering
class StateBuilder<T> extends StatelessWidget {
  final AsyncSnapshot<T> snapshot;
  final Widget Function(BuildContext, T data) onData;
  final Widget? onLoading;
  final Widget Function(BuildContext, Object error)? onError;
  final Widget? onEmpty;

  const StateBuilder({
    Key? key,
    required this.snapshot,
    required this.onData,
    this.onLoading,
    this.onError,
    this.onEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return onLoading ?? const SizedBox.shrink();
    }

    if (snapshot.hasError) {
      if (onError != null) {
        return onError!(context, snapshot.error ?? Exception('Unknown error'));
      }
      return ConnectionError();
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return onEmpty ?? NoDataState(title: 'Veri bulunamadı');
    }

    return onData(context, snapshot.data as T);
  }
}
