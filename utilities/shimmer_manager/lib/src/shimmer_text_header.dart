import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTextHeader extends StatelessWidget {
  final double? width;
  final double height;
  final double borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerTextHeader({
    super.key,
    this.width,
    required this.height,
    this.borderRadius = 4,
    this.baseColor,
    this.highlightColor,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.white.withValues(alpha: 0.8),
      highlightColor: highlightColor ?? Colors.white.withValues(alpha: 0.2),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
