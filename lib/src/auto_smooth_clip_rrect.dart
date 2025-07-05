import 'package:flutter/material.dart';
import 'auto_smooth_rectangle_border.dart';
import 'auto_smooth_border_radius.dart';
import 'smooth_corner_config.dart';

/// Clips its child with smooth corners using AutoSmoothRectangleBorder logic.
class AutoSmoothClipRRect extends StatelessWidget {
  final Widget child;
  final double? _smoothingFactor;
  final AutoSmoothBorderRadius? autoSmoothBorderRadius;
  final Clip clipBehavior;

  /// Creates a widget that clips its child with smooth corners.
  ///
  /// If [smoothingFactor] is not provided, it will use the value from the nearest
  /// [SmoothCornerConfig] ancestor, or a default of 0.6 if none is found.
  const AutoSmoothClipRRect({
    super.key,
    required this.child,
    double? smoothingFactor,
    this.autoSmoothBorderRadius,
    this.clipBehavior = Clip.antiAlias,
  }) : _smoothingFactor = smoothingFactor;

  /// The smoothing factor for the corners.
  ///
  /// If not provided, falls back to the value from [SmoothCornerConfig].
  double get smoothingFactor => _smoothingFactor ?? SmoothCornerConfig.defaults.defaultSmoothingFactor;

  @override
  Widget build(BuildContext context) {
    // Get the configuration from the nearest ancestor, or use defaults
    final config = SmoothCornerConfig.of(context);
    
    // Use the local smoothing factor if provided, otherwise use the one from config
    final effectiveSmoothingFactor = _smoothingFactor ?? config.defaultSmoothingFactor;
    
    return ClipPath(
      clipper: _AutoSmoothClipper(
        smoothingFactor: effectiveSmoothingFactor,
        autoSmoothBorderRadius: autoSmoothBorderRadius ?? config.defaultAutoSmoothBorderRadius,
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
    required double smoothingFactor,
    this.autoSmoothBorderRadius,
  }) : smoothingFactor = smoothingFactor;

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
