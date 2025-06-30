import 'package:flutter/material.dart';
import 'auto_smooth_rectangle_border.dart';
import 'auto_smooth_border_radius.dart';

/// Clips its child with smooth corners using AutoSmoothRectangleBorder logic.
class AutoSmoothClipRRect extends StatelessWidget {
  final Widget child;
  final double smoothingFactor;
  final AutoSmoothBorderRadius? autoSmoothBorderRadius;
  final Clip clipBehavior;

  const AutoSmoothClipRRect({
    super.key,
    required this.child,
    this.smoothingFactor = 0.6,
    this.autoSmoothBorderRadius,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _AutoSmoothClipper(
        smoothingFactor: smoothingFactor,
        autoSmoothBorderRadius: autoSmoothBorderRadius,
      ),
      clipBehavior: clipBehavior,
      child: child,
    );
  }
}

class _AutoSmoothClipper extends CustomClipper<Path> {
  final double smoothingFactor;
  final AutoSmoothBorderRadius? autoSmoothBorderRadius;

  _AutoSmoothClipper({
    required this.smoothingFactor,
    this.autoSmoothBorderRadius,
  });

  @override
  Path getClip(Size size) {
    // Use the same logic as AutoSmoothRectangleBorder (currently RRect placeholder)
    final border = AutoSmoothRectangleBorder(
      smoothingFactor: smoothingFactor,
      autoSmoothBorderRadius: autoSmoothBorderRadius,
    );
    return border.getOuterPath(Offset.zero & size);
  }

  @override
  bool shouldReclip(_AutoSmoothClipper oldClipper) {
    return smoothingFactor != oldClipper.smoothingFactor ||
        autoSmoothBorderRadius != oldClipper.autoSmoothBorderRadius;
  }
}
