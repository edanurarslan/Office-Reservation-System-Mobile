import 'package:flutter/material.dart';

/// Spacing constants following 8px grid system
class AppSpacing {
  AppSpacing._();

  // 8px grid unit
  static const double xs = 4.0;    // 0.5x
  static const double sm = 8.0;    // 1x
  static const double md = 12.0;   // 1.5x
  static const double lg = 16.0;   // 2x
  static const double xl = 24.0;   // 3x
  static const double xxl = 32.0;  // 4x
  static const double xxxl = 48.0; // 6x

  // Specific use cases
  static const double cornerRadius = 12.0;
  static const double largeCornerRadius = 16.0;
  static const double dialogCornerRadius = 20.0;

  // Padding presets
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);

  // Padding combinations
  static const EdgeInsets paddingHorizontalSm =
      EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMd =
      EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLg =
      EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets paddingHorizontalXl =
      EdgeInsets.symmetric(horizontal: xl);

  static const EdgeInsets paddingVerticalSm =
      EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMd =
      EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLg =
      EdgeInsets.symmetric(vertical: lg);
  static const EdgeInsets paddingVerticalXl =
      EdgeInsets.symmetric(vertical: xl);

  // Standard page padding
  static const EdgeInsets pagePadding = EdgeInsets.all(lg);
  static const EdgeInsets pageHorizontalPadding =
      EdgeInsets.symmetric(horizontal: lg);

  // Section padding
  static const EdgeInsets sectionPadding = EdgeInsets.all(xl);
  static const EdgeInsets sectionInsets = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // Card padding
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);

  // Input field padding
  static const EdgeInsets inputPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // Button padding
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
  static const EdgeInsets largeButtonPadding = EdgeInsets.symmetric(
    horizontal: xl,
    vertical: lg,
  );

  // Dialog padding
  static const EdgeInsets dialogPadding = EdgeInsets.all(xl);

  // List item padding
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // Avatar spacing
  static const double avatarSize = 48.0;
  static const double largeAvatarSize = 64.0;
  static const double smallAvatarSize = 32.0;

  // Icon spacing
  static const double iconSize = 24.0;
  static const double largeIconSize = 32.0;
  static const double smallIconSize = 16.0;

  // Line heights
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightLoose = 1.8;
}

/// Responsive spacing helper
class ResponsiveSpacing {
  ResponsiveSpacing._();

  static double getPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return AppSpacing.lg; // Phone: 16px
    } else if (width < 1024) {
      return AppSpacing.xl; // Tablet: 24px
    } else {
      return AppSpacing.xxl; // Desktop: 32px
    }
  }

  static double getHorizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return AppSpacing.lg; // Phone: 16px
    } else if (width < 1024) {
      return AppSpacing.xl; // Tablet: 24px
    } else {
      return AppSpacing.xxxl; // Desktop: 48px
    }
  }

  static int getGridCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return 1; // Phone: 1 column
    } else if (width < 1024) {
      return 2; // Tablet: 2 columns
    } else {
      return 3; // Desktop: 3 columns
    }
  }

  static double getGapSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) {
      return AppSpacing.md; // Phone: 12px
    } else if (width < 1024) {
      return AppSpacing.lg; // Tablet: 16px
    } else {
      return AppSpacing.xl; // Desktop: 24px
    }
  }
}

/// Convenient SizedBox helper for vertical spacing
class VSpace extends StatelessWidget {
  final double height;

  const VSpace(this.height, {Key? key}) : super(key: key);

  // Preset sizes
  factory VSpace.xs() => const VSpace(AppSpacing.xs);
  factory VSpace.sm() => const VSpace(AppSpacing.sm);
  factory VSpace.md() => const VSpace(AppSpacing.md);
  factory VSpace.lg() => const VSpace(AppSpacing.lg);
  factory VSpace.xl() => const VSpace(AppSpacing.xl);
  factory VSpace.xxl() => const VSpace(AppSpacing.xxl);
  factory VSpace.xxxl() => const VSpace(AppSpacing.xxxl);

  @override
  Widget build(BuildContext context) => SizedBox(height: height);
}

/// Convenient SizedBox helper for horizontal spacing
class HSpace extends StatelessWidget {
  final double width;

  const HSpace(this.width, {Key? key}) : super(key: key);

  // Preset sizes
  factory HSpace.xs() => const HSpace(AppSpacing.xs);
  factory HSpace.sm() => const HSpace(AppSpacing.sm);
  factory HSpace.md() => const HSpace(AppSpacing.md);
  factory HSpace.lg() => const HSpace(AppSpacing.lg);
  factory HSpace.xl() => const HSpace(AppSpacing.xl);
  factory HSpace.xxl() => const HSpace(AppSpacing.xxl);
  factory HSpace.xxxl() => const HSpace(AppSpacing.xxxl);

  @override
  Widget build(BuildContext context) => SizedBox(width: width);
}
