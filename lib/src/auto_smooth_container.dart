import 'package:flutter/material.dart';
import 'auto_smooth_rectangle_border.dart';
import 'auto_smooth_border_radius.dart';
import 'smooth_corner_config.dart';

/// A Container-like widget with smooth corners using AutoSmoothRectangleBorder.
class AutoSmoothContainer extends StatelessWidget {
  final Widget? child;
  final double? _smoothingFactor;
  final AutoSmoothBorderRadius? autoSmoothBorderRadius;
  final BorderSide? side;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;
  final DecorationImage? image;

  /// Creates a container with smooth corners.
  ///
  /// If [smoothingFactor] is not provided, it will use the value from the nearest
  /// [SmoothCornerConfig] ancestor, or a default of 0.6 if none is found.
  const AutoSmoothContainer({
    super.key,
    this.child,
    double? smoothingFactor,
    this.autoSmoothBorderRadius,
    this.side,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.alignment,
    this.constraints,
    this.image,
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
    
    Widget content = child ?? const SizedBox.shrink();
    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }
    return Container(
      width: width,
      height: height,
      margin: margin,
      alignment: alignment,
      constraints: constraints,
      decoration: ShapeDecoration(
        color: color,
        image: image,
        shape: AutoSmoothRectangleBorder(
          smoothingFactor: effectiveSmoothingFactor,
          autoSmoothBorderRadius: autoSmoothBorderRadius ?? config.defaultAutoSmoothBorderRadius,
          side: side ?? BorderSide.none,
        ),
      ),
      child: content,
    );
  }
}
