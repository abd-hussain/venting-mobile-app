import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTile extends StatelessWidget {
  final bool hasLeading;
  final bool hasTrailing;
  final double? leadingSize;
  final double? titleWidth;
  final double? subtitleWidth;
  final EdgeInsetsGeometry? padding;

  const ShimmerTile({
    super.key,
    this.hasLeading = true,
    this.hasTrailing = true,
    this.leadingSize,
    this.titleWidth,
    this.subtitleWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final defaultLeadingSize = leadingSize ?? 48.0;
    final defaultTitleWidth = titleWidth ?? 200.0;
    final defaultSubtitleWidth = subtitleWidth ?? 150.0;

    return Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[300]!,
        child: Row(
          children: [
            if (hasLeading)
              Container(
                width: defaultLeadingSize,
                height: defaultLeadingSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            if (hasLeading) const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: defaultTitleWidth,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: defaultSubtitleWidth,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
            if (hasTrailing)
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
