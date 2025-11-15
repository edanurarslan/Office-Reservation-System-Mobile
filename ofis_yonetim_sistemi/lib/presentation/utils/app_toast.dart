import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Toast message types
enum ToastType {
  success,
  error,
  warning,
  info,
}

/// Toast configuration and service
class AppToast {
  /// Show success toast
  static void success(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      context,
      message,
      ToastType.success,
      duration: duration,
    );
  }

  /// Show error toast
  static void error(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 4),
  }) {
    _show(
      context,
      message,
      ToastType.error,
      duration: duration,
    );
  }

  /// Show warning toast
  static void warning(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      context,
      message,
      ToastType.warning,
      duration: duration,
    );
  }

  /// Show info toast
  static void info(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    _show(
      context,
      message,
      ToastType.info,
      duration: duration,
    );
  }

  /// Show custom toast
  static void _show(
    BuildContext context,
    String message,
    ToastType type, {
    Duration duration = const Duration(seconds: 3),
  }) {
    // Remove any existing snackbars
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: Row(
        children: [
          _getIcon(type),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      duration: duration,
      backgroundColor: _getBackgroundColor(type),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 8,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Get icon for toast type
  static Widget _getIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check_circle,
            color: Colors.white,
            size: 16,
          ),
        );
      case ToastType.error:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.error,
            color: Colors.white,
            size: 16,
          ),
        );
      case ToastType.warning:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.warning,
            color: Colors.white,
            size: 16,
          ),
        );
      case ToastType.info:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.info,
            color: Colors.white,
            size: 16,
          ),
        );
    }
  }

  /// Get background color for toast type
  static Color _getBackgroundColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return const Color(0xFF4CAF50); // Green
      case ToastType.error:
        return const Color(0xFFE53935); // Red
      case ToastType.warning:
        return const Color(0xFFFFA726); // Orange
      case ToastType.info:
        return const Color(0xFF1976D2); // Blue
    }
  }
}

/// Toast with action button
class ActionToast {
  static void show(
    BuildContext context,
    String message, {
    required String actionLabel,
    required VoidCallback onAction,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 5),
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: Row(
        children: [
          AppToast._getIcon(type),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      action: SnackBarAction(
        label: actionLabel,
        textColor: Colors.white,
        onPressed: onAction,
      ),
      duration: duration,
      backgroundColor: AppToast._getBackgroundColor(type),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 8,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
