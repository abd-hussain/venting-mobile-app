import 'package:flutter/material.dart';

/// Shared ventor points balance across home, rewards, and checkout flows.
class VentorPointsScope extends InheritedWidget {
  const VentorPointsScope({
    super.key,
    required this.points,
    required this.onPointsChanged,
    required super.child,
  });

  final int points;
  final ValueChanged<int> onPointsChanged;

  static VentorPointsScope of(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<VentorPointsScope>();
    assert(scope != null, 'VentorPointsScope not found in widget tree');
    return scope!;
  }

  static VentorPointsScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<VentorPointsScope>();
  }

  void addPoints(int amount) {
    if (amount <= 0) return;
    onPointsChanged(points + amount);
  }

  bool spendPoints(int amount) {
    if (amount <= 0 || points < amount) return false;
    onPointsChanged(points - amount);
    return true;
  }

  @override
  bool updateShouldNotify(VentorPointsScope oldWidget) {
    return oldWidget.points != points;
  }
}
