import 'package:flutter/material.dart';
import 'auto_smooth_rectangle_border.dart';
import 'auto_smooth_border_radius.dart';

/// A Card-like widget with smooth corners and elevation.
class AutoSmoothCard extends StatelessWidget {
  final Widget? child;
  final double elevation;
  final Color? color;
  final double smoothingFactor;
  final AutoSmoothBorderRadius? autoSmoothBorderRadius;
  final BorderSide? side;
  final EdgeInsetsGeometry? margin;
  final Clip clipBehavior;

  const AutoSmoothCard({
    super.key,
    this.child,
    this.elevation = 1.0,
    this.color,
    this.smoothingFactor = 0.6,
    this.autoSmoothBorderRadius,
    this.side,
    this.margin,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(4.0),
      child: Material(
        color: color,
        elevation: elevation,
        shape: AutoSmoothRectangleBorder(
          smoothingFactor: smoothingFactor,
          autoSmoothBorderRadius: autoSmoothBorderRadius,
          side: side ?? BorderSide.none,
        ),
        clipBehavior: clipBehavior,
        child: child,
      ),
    );
  }
}
