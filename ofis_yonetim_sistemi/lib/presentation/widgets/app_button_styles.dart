import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Button styles helper - provides consistent button styling across the app
class AppButtonStyles {
  AppButtonStyles._();

  // Primary button style (filled, full color)
  static ButtonStyle primaryButton({
    double height = 48,
    double horizontalPadding = 24,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: (height - 16) / 2, // Subtract text height
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Secondary button style (outlined)
  static ButtonStyle secondaryButton({
    double height = 48,
    double horizontalPadding = 24,
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: const Color(0xFF6366F1),
      side: const BorderSide(
        color: Color(0xFF6366F1),
        width: 1.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: (height - 16) / 2,
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Ghost button style (no background, text only)
  static ButtonStyle ghostButton({
    Color textColor = const Color(0xFF6366F1),
  }) {
    return TextButton.styleFrom(
      foregroundColor: textColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Danger button style (red)
  static ButtonStyle dangerButton({
    double height = 48,
    double horizontalPadding = 24,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.red[600],
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: (height - 16) / 2,
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Success button style (green)
  static ButtonStyle successButton({
    double height = 48,
    double horizontalPadding = 24,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.green[600],
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: (height - 16) / 2,
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Small button style
  static ButtonStyle smallButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      textStyle: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Large button style (full width)
  static ButtonStyle largeButton({double height = 56}) {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: (height - 16) / 2,
      ),
      textStyle: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      minimumSize: const Size.fromHeight(56),
    );
  }

  // Icon button with label
  static ButtonStyle iconButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6366F1),
      foregroundColor: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  // Disabled button style
  static ButtonStyle disabledButton() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[300],
      foregroundColor: Colors.grey[600],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

/// Elevated button with standard styling
class AppElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final IconData? icon;
  final ButtonStyle? style;
  final bool isEnabled;

  const AppElevatedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.icon,
    this.style,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled && !isLoading ? onPressed : null,
      style: style ?? AppButtonStyles.primaryButton(),
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, size: 18),
                    const SizedBox(width: 8),
                    Text(label),
                  ],
                )
              : Text(label),
    );
  }
}

/// Outlined button with standard styling
class AppOutlinedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final ButtonStyle? style;

  const AppOutlinedButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: style ?? AppButtonStyles.secondaryButton(),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 18),
                const SizedBox(width: 8),
                Text(label),
              ],
            )
          : Text(label),
    );
  }
}

/// Text button with standard styling
class AppTextButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final Color? color;

  const AppTextButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: AppButtonStyles.ghostButton(textColor: color ?? const Color(0xFF6366F1)),
      child: icon != null
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 18),
                const SizedBox(width: 8),
                Text(label),
              ],
            )
          : Text(label),
    );
  }
}
