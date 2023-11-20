import 'package:daily_news/config/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerLayout extends StatelessWidget {
  const ShimmerLayout({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    const Color color = AppColors.greyColor;

    return Shimmer.fromColors(
      highlightColor: color.withOpacity(0.2),
      baseColor: color.withOpacity(0.8),
      period: const Duration(milliseconds: 3000),
      child: child,
    );
  }
}
