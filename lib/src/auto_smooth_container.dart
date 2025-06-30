import 'package:flutter/material.dart';
import 'auto_smooth_rectangle_border.dart';
import 'auto_smooth_border_radius.dart';

/// A Container-like widget with smooth corners using AutoSmoothRectangleBorder.
class AutoSmoothContainer extends StatelessWidget {
  final Widget? child;
  final double smoothingFactor;
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

  const AutoSmoothContainer({
    super.key,
    this.child,
    this.smoothingFactor = 0.6,
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
  });

  @override
  Widget build(BuildContext context) {
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
          smoothingFactor: smoothingFactor,
          autoSmoothBorderRadius: autoSmoothBorderRadius,
          side: side ?? BorderSide.none,
        ),
      ),
      child: content,
    );
  }
}
