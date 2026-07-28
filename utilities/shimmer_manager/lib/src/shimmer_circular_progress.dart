import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircularProgress extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const ShimmerCircularProgress({
    super.key,
    required this.size,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[100]!,
      highlightColor: Colors.grey[300]!,
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
