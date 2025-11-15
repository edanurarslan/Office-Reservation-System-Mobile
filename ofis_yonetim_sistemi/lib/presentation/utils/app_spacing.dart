import 'package:flutter/material.dart';

/// Standard spacing constants for consistent UI
class AppSpacing {
  // Base unit (8dp grid system)
  static const double xs = 4.0;   // Extra small
  static const double sm = 8.0;   // Small
  static const double md = 12.0;  // Medium
  static const double lg = 16.0;  // Large
  static const double xl = 20.0;  // Extra large
  static const double xxl = 24.0; // Double extra large
  static const double xxxl = 32.0; // Triple extra large
  static const double max = 48.0; // Maximum

  // Common combinations
  static const EdgeInsets paddingXSmall = EdgeInsets.all(xs);
  static const EdgeInsets paddingSmall = EdgeInsets.all(sm);
  static const EdgeInsets paddingMedium = EdgeInsets.all(md);
  static const EdgeInsets paddingLarge = EdgeInsets.all(lg);
  static const EdgeInsets paddingXLarge = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXLarge = EdgeInsets.all(xxl);

  // Horizontal padding
  static const EdgeInsets paddingHorizontalSmall =
      EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets paddingHorizontalMedium =
      EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets paddingHorizontalLarge =
      EdgeInsets.symmetric(horizontal: lg);

  // Vertical padding
  static const EdgeInsets paddingVerticalSmall =
      EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets paddingVerticalMedium =
      EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets paddingVerticalLarge =
      EdgeInsets.symmetric(vertical: lg);

  // Combinations for cards and containers
  static const EdgeInsets cardPadding = EdgeInsets.all(lg);
  static const EdgeInsets screenPadding = EdgeInsets.all(lg);
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  // Border radius
  static const double borderRadiusSmall = 6.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;
  static const double borderRadiusXLarge = 16.0;

  // Common radius styles
  static final BorderRadius radiusSmall =
      BorderRadius.circular(borderRadiusSmall);
  static final BorderRadius radiusMedium =
      BorderRadius.circular(borderRadiusMedium);
  static final BorderRadius radiusLarge =
      BorderRadius.circular(borderRadiusLarge);
  static final BorderRadius radiusXLarge =
      BorderRadius.circular(borderRadiusXLarge);

  // Common border radius
  static const BorderRadius containerRadius =
      BorderRadius.all(Radius.circular(borderRadiusMedium));
  static const BorderRadius cardRadius =
      BorderRadius.all(Radius.circular(borderRadiusLarge));
  static const BorderRadius buttonRadius =
      BorderRadius.all(Radius.circular(borderRadiusMedium));

  // Elevation/Shadow
  static const double elevationSmall = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationLarge = 8.0;

  // Common gaps
  static const SizedBox gapXSmall = SizedBox.square(dimension: xs);
  static const SizedBox gapSmall = SizedBox.square(dimension: sm);
  static const SizedBox gapMedium = SizedBox.square(dimension: md);
  static const SizedBox gapLarge = SizedBox.square(dimension: lg);
  static const SizedBox gapXLarge = SizedBox.square(dimension: xl);
  static const SizedBox gapXXLarge = SizedBox.square(dimension: xxl);

  // Horizontal gaps
  static const SizedBox hGapXSmall = SizedBox(width: xs);
  static const SizedBox hGapSmall = SizedBox(width: sm);
  static const SizedBox hGapMedium = SizedBox(width: md);
  static const SizedBox hGapLarge = SizedBox(width: lg);
  static const SizedBox hGapXLarge = SizedBox(width: xl);
  static const SizedBox hGapXXLarge = SizedBox(width: xxl);

  // Vertical gaps
  static const SizedBox vGapXSmall = SizedBox(height: xs);
  static const SizedBox vGapSmall = SizedBox(height: sm);
  static const SizedBox vGapMedium = SizedBox(height: md);
  static const SizedBox vGapLarge = SizedBox(height: lg);
  static const SizedBox vGapXLarge = SizedBox(height: xl);
  static const SizedBox vGapXXLarge = SizedBox(height: xxl);

  // Helper method for custom padding
  static EdgeInsets customPadding({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return EdgeInsets.only(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
    );
  }

  // Helper method for symmetrical padding
  static EdgeInsets symmetricPadding({
    double horizontal = 0,
    double vertical = 0,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }
}

/// Visual spacing guide widget (development/debugging)
class SpacingGuide extends StatelessWidget {
  const SpacingGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spacing Standards',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          AppSpacing.vGapLarge,
          _SpacingItem(label: 'XS (4px)', value: AppSpacing.xs),
          _SpacingItem(label: 'SM (8px)', value: AppSpacing.sm),
          _SpacingItem(label: 'MD (12px)', value: AppSpacing.md),
          _SpacingItem(label: 'LG (16px)', value: AppSpacing.lg),
          _SpacingItem(label: 'XL (20px)', value: AppSpacing.xl),
          _SpacingItem(label: 'XXL (24px)', value: AppSpacing.xxl),
          _SpacingItem(label: 'XXXL (32px)', value: AppSpacing.xxxl),
          _SpacingItem(label: 'MAX (48px)', value: AppSpacing.max),
        ],
      ),
    );
  }
}

class _SpacingItem extends StatelessWidget {
  final String label;
  final double value;

  const _SpacingItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Container(
          height: value,
          color: Colors.indigo[200],
          width: 200,
        ),
        AppSpacing.vGapMedium,
      ],
    );
  }
}
