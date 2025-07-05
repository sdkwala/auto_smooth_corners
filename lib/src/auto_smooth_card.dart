import 'package:flutter/material.dart';
import 'auto_smooth_rectangle_border.dart';
import 'auto_smooth_border_radius.dart';
import 'smooth_corner_config.dart';

/// A Card-like widget with smooth corners and elevation.
class AutoSmoothCard extends StatelessWidget {
  final Widget? child;
  final double elevation;
  final Color? color;
  final double? _smoothingFactor;
  final AutoSmoothBorderRadius? autoSmoothBorderRadius;
  final BorderSide? side;
  final EdgeInsetsGeometry? margin;
  final Clip clipBehavior;

  /// Creates a card with smooth corners and elevation.
  ///
  /// If [smoothingFactor] is not provided, it will use the value from the nearest
  /// [SmoothCornerConfig] ancestor, or a default of 0.6 if none is found.
  const AutoSmoothCard({
    super.key,
    this.child,
    this.elevation = 1.0,
    this.color,
    double? smoothingFactor,
    this.autoSmoothBorderRadius,
    this.side,
    this.margin,
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
    
    return Container(
      margin: margin ?? const EdgeInsets.all(4.0),
      child: Material(
        color: color,
        elevation: elevation,
        shape: AutoSmoothRectangleBorder(
          smoothingFactor: effectiveSmoothingFactor,
          autoSmoothBorderRadius: autoSmoothBorderRadius ?? config.defaultAutoSmoothBorderRadius,
          side: side ?? BorderSide.none,
        ),
        clipBehavior: clipBehavior,
        child: child,
      ),
    );
  }
}
