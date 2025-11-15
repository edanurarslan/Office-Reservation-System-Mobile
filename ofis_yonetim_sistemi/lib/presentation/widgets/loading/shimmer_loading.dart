import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ofis_yonetim_sistemi/core/theme/app_theme.dart';

/// Shimmer loading widget for skeleton screens
class ShimmerLoading extends StatelessWidget {
  final bool enabled;
  final Widget child;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerLoading({
    Key? key,
    this.enabled = true,
    required this.child,
    this.baseColor = const Color.fromARGB(255, 228, 231, 236),
    this.highlightColor = const Color.fromARGB(255, 245, 245, 245),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child,
    );
  }
}

/// Skeleton loader for list items
class SkeletonListItem extends StatelessWidget {
  final double height;
  final EdgeInsets padding;

  const SkeletonListItem({
    Key? key,
    this.height = 80,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 16,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Skeleton loader for cards
class SkeletonCard extends StatelessWidget {
  final double height;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  const SkeletonCard({
    Key? key,
    this.height = 120,
    this.padding = const EdgeInsets.all(12),
    BorderRadius? borderRadius,
  })  : borderRadius = borderRadius ?? const BorderRadius.all(Radius.circular(12)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}

/// Skeleton loader for table rows
class SkeletonTableRow extends StatelessWidget {
  final List<double> columnWidths;
  final double height;
  final EdgeInsets padding;

  const SkeletonTableRow({
    Key? key,
    this.columnWidths = const [0.3, 0.3, 0.2],
    this.height = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Padding(
        padding: padding,
        child: Row(
          children: columnWidths
              .map(
                (width) => Expanded(
                  flex: (width * 10).toInt(),
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

/// Skeleton loader for profile/avatar
class SkeletonAvatar extends StatelessWidget {
  final double radius;
  final double? width;
  final double? height;

  const SkeletonAvatar({
    Key? key,
    this.radius = 24,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        width: width ?? radius * 2,
        height: height ?? radius * 2,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// Complete skeleton for user list loading
class UserListSkeleton extends StatelessWidget {
  final int itemCount;

  const UserListSkeleton({
    Key? key,
    this.itemCount = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SkeletonAvatar(radius: 24),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerLoading(
                        child: Container(
                          height: 16,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ShimmerLoading(
                        child: Container(
                          height: 12,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Complete skeleton for reservation list loading
class ReservationListSkeleton extends StatelessWidget {
  final int itemCount;

  const ReservationListSkeleton({
    Key? key,
    this.itemCount = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: SkeletonCard(height: 100),
        );
      },
    );
  }
}

/// Skeleton loader for dashboard stats
class StatCardSkeleton extends StatelessWidget {
  const StatCardSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 14,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 32,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Skeleton grid for dashboard
class DashboardSkeleton extends StatelessWidget {
  final int columnCount;

  const DashboardSkeleton({
    Key? key,
    this.columnCount = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columnCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const StatCardSkeleton(),
    );
  }
}
