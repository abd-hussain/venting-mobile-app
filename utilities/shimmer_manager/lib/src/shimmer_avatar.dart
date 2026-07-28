import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAvatar extends StatelessWidget {
  final double size;
  final Color? backgroundColor;

  const ShimmerAvatar({super.key, required this.size, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
