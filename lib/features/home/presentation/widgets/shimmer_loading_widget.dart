import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/extensions/context_extensions.dart';

class DashboardCardSkeleton extends StatelessWidget {
  const DashboardCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: .start,
      crossAxisAlignment: .start,
      spacing: 15,
      runSpacing: 15,
      children: List.generate(5, (_) => _buildCardSkeleton(context)),
    );
  }

  Widget _buildCardSkeleton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: context.isDesktop
            ? context.width * .15
            : context.isTablet
            ? context.width * .25
            : context.width * .42,
      ),
      child: Card(
        child: Padding(
          padding: const .symmetric(horizontal: 20, vertical: 20),
          child: Shimmer.fromColors(
            baseColor: AppColors.textSecondary.withValues(alpha: 0.3),
            highlightColor: AppColors.textSecondary.withValues(alpha: 0.1),
            child: Row(
              children: [
                /// 📝 Texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: .start,
                    children: [
                      _box(height: 22, width: 70), // number
                      const SizedBox(height: 12),
                      _box(height: 14, width: 120), // subtitle
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                /// 🔵 Icon circle
                _circle(size: 42),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _box({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _circle({required double size}) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
    );
  }
}
