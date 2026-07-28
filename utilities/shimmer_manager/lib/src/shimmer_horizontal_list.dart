import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHorizontalList extends StatelessWidget {
  final int itemCount;
  final double itemWidth;
  final double itemHeight;
  final double spacing;
  final EdgeInsetsGeometry? padding;

  const ShimmerHorizontalList({
    super.key,
    this.itemCount = 5,
    required this.itemWidth,
    required this.itemHeight,
    this.spacing = 12,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[300]!,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Container(
              width: itemWidth,
              margin: EdgeInsets.only(
                right: index < itemCount - 1 ? spacing : 0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
            );
          },
        ),
      ),
    );
  }
}
