import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ofis_yonetim_sistemi/core/theme/app_theme.dart';

/// Standard button styles for consistent UI
class AppButtonStyles {
  /// Primary button style (solid color)
  static ElevatedButtonThemeData get primaryButton {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primaryIndigo,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 2,
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Secondary button style (outlined)
  static OutlinedButtonThemeData get secondaryButton {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primaryIndigo,
        side: const BorderSide(
          color: AppTheme.primaryIndigo,
          width: 1.5,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Danger button style (red)
  static ElevatedButtonThemeData get dangerButton {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE53935),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Small button style (for compact spaces)
  static ButtonStyle get smallButton {
    return ElevatedButton.styleFrom(
      backgroundColor: AppTheme.primaryIndigo,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Large button style (full width)
  static ButtonStyle get largeButton {
    return ElevatedButton.styleFrom(
      backgroundColor: AppTheme.primaryIndigo,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 16,
      ),
      minimumSize: const Size.fromHeight(50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Text button (minimal style)
  static TextButtonThemeData get textButton {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppTheme.primaryIndigo,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        textStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Icon button style
  static IconButtonThemeData get iconButton {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: AppTheme.primaryIndigo,
        padding: const EdgeInsets.all(8),
      ),
    );
  }

  /// Floating action button style
  static FloatingActionButtonThemeData get fab {
    return FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primaryIndigo,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
    );
  }

  /// Helper method for custom button with padding
  static ButtonStyle customButton({
    required Color backgroundColor,
    required Color foregroundColor,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 12,
    ),
    double borderRadius = 8,
    double elevation = 2,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: elevation,
    );
  }

  /// Helper method for loading button
  static ButtonStyle loadingButton({
    Color backgroundColor = AppTheme.primaryIndigo,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor.withOpacity(0.7),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

/// Helper widget for loading button state
class LoadingButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final bool isSmall;

  const LoadingButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.width,
    this.height = 48,
    this.backgroundColor = AppTheme.primaryIndigo,
    this.textColor = Colors.white,
    this.icon,
    this.isSmall = false,
  }) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ElevatedButton.icon(
        onPressed: widget.isLoading ? null : widget.onPressed,
        icon: widget.isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(widget.textColor),
                ),
              )
            : (widget.icon != null ? Icon(widget.icon) : null),
        label: Text(
          widget.label,
          style: GoogleFonts.inter(
            fontSize: widget.isSmall ? 12 : 14,
            fontWeight: FontWeight.w600,
            color: widget.textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          foregroundColor: widget.textColor,
          disabledBackgroundColor: widget.backgroundColor.withOpacity(0.6),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isSmall ? 12 : 24,
            vertical: widget.isSmall ? 8 : 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
