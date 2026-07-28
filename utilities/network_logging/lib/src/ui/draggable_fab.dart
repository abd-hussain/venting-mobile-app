import 'package:flutter/material.dart';

import 'package:network_logging/src/ui/theme/network_logging_theme.dart';

class DraggableFAB extends StatefulWidget {
  final VoidCallback onFabPressed;
  const DraggableFAB({super.key, required this.onFabPressed});

  @override
  _DraggableFABState createState() => _DraggableFABState();
}

class _DraggableFABState extends State<DraggableFAB> {
  Offset? fabPosition; // Will be set to bottom right on first build
  static const double fabSize = 40; // Size of the mini FAB
  static const double verticalPadding = 80;
  static const double horizontalPadding = 16;

  @override
  Widget build(BuildContext context) {
    final colors = NetworkLoggingTheme.colors(context);
    final screenSize = MediaQuery.sizeOf(context);

    // Set initial position to bottom right if not set
    fabPosition ??= Offset(
      screenSize.width - fabSize - horizontalPadding, // Right edge with padding
      screenSize.height - fabSize - verticalPadding, // Bottom edge with padding
    );

    return Positioned(
      left: fabPosition!.dx, // Fixed: dx for horizontal position
      top: fabPosition!.dy, // Fixed: dy for vertical position
      child: Draggable(
        feedback: FloatingActionButton(
          mini: true,
          backgroundColor: colors.brand500,
          foregroundColor: Colors.white,
          onPressed: widget.onFabPressed,
          child: const Icon(Icons.network_check, size: 20),
        ),
        childWhenDragging: Container(
          width: fabSize,
          height: fabSize,
          color: Colors.transparent,
        ),
        child: FloatingActionButton(
          mini: true,
          backgroundColor: colors.brand500,
          foregroundColor: Colors.white,
          onPressed: widget.onFabPressed,
          child: const Icon(Icons.network_check, size: 20),
        ),
        onDragEnd: (DraggableDetails details) {
          setState(() {
            // Clamp the position to keep FAB within screen bounds with padding
            final clampedX = details.offset.dx.clamp(
              horizontalPadding,
              screenSize.width - fabSize - horizontalPadding,
            );
            final clampedY = details.offset.dy.clamp(
              verticalPadding,
              screenSize.height - fabSize - verticalPadding,
            );
            fabPosition = Offset(clampedX, clampedY);
          });
        },
      ),
    );
  }
}
