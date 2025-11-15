import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // ========== COLORS ==========
  static const Color primaryIndigo = Color(0xFF6366F1);
  static const Color accentIndigo = Color(0xFF818CF8);
  static const Color primaryIndigoLight = Color(0xFF818CF8);
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Color(0xFFEEF2FF);
  static const Color surfaceBorder = Color(0xFFE0E7FF);
  static const Color textPrimary = Color(0xFF312E81);
  static const Color textSecondary = Color(0xFF818CF8);
  static const Color textTertiary = Color(0xFF6366F1);

  // ========== SHADOWS (Material Design 3) ==========
  /// Level 1: Small elevation (buttons, chips)
  static BoxShadow shadowLevel1 = BoxShadow(
    color: primaryIndigo.withOpacity(0.08),
    blurRadius: 2,
    offset: const Offset(0, 1),
  );

  /// Level 2: Small-medium elevation (inputs)
  static BoxShadow shadowLevel2 = BoxShadow(
    color: primaryIndigo.withOpacity(0.10),
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  /// Level 3: Medium elevation (cards, panels) - DEFAULT
  static BoxShadow shadowLevel3 = BoxShadow(
    color: primaryIndigo.withOpacity(0.12),
    blurRadius: 8,
    offset: const Offset(0, 4),
  );

  /// Level 4: Medium-large elevation (elevated cards, modals)
  static BoxShadow shadowLevel4 = BoxShadow(
    color: primaryIndigo.withOpacity(0.14),
    blurRadius: 12,
    offset: const Offset(0, 6),
  );

  /// Level 5: Large elevation (floating buttons, menus)
  static BoxShadow shadowLevel5 = BoxShadow(
    color: primaryIndigo.withOpacity(0.16),
    blurRadius: 16,
    offset: const Offset(0, 8),
  );

  // ========== ELEVATIONS ==========
  static const double elevationDefault = 0.0;
  static const double elevationSmall = 1.0;
  static const double elevationMedium = 3.0;
  static const double elevationLarge = 6.0;
  static const double elevationDialog = 24.0;
  
  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF818CF8), Color(0xFF6366F1), Color(0xFF4F46E5)],
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primaryIndigo,
        secondary: primaryIndigoLight,
        surface: backgroundLight,
        onPrimary: Colors.white,
        onSurface: textPrimary,
      ),
      textTheme: GoogleFonts.interTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: surfaceBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryIndigo, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryIndigo,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
  
  static ThemeData get darkTheme => lightTheme;

  static BoxDecoration glassCard() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.85),
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white.withOpacity(0.2)),
      boxShadow: [shadowLevel4], // Changed from Level 5 to Level 4
    );
  }

  static BoxDecoration dashboardCard() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(19.2),
      border: Border.all(color: surfaceBorder),
      boxShadow: [shadowLevel3], // Standardized to Level 3
    );
  }

  static BoxDecoration statCard() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(19.2),
      border: Border.all(color: surfaceBorder),
      boxShadow: [shadowLevel3], // Standardized to Level 3
    );
  }
}
