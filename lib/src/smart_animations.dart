import 'package:flutter/widgets.dart';

/// Built-in animation styles for SmartAnimated* widgets.
enum SmartAnimationType { fade, slide, scale }

/// A small helper that wraps [child] with a transition based on [type].
/// You can reuse this in multiple animated widgets.
Widget buildSmartTransition({
  required SmartAnimationType type,
  required Animation<double> animation,
  required Widget child,
  Offset beginOffset = const Offset(0.0, 0.12),
}) {
  switch (type) {
    case SmartAnimationType.fade:
      return FadeTransition(opacity: animation, child: child);
    case SmartAnimationType.slide:
      return SlideTransition(
        position: Tween<Offset>(
          begin: beginOffset,
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    case SmartAnimationType.scale:
      return ScaleTransition(scale: animation, child: child);
  }
}
