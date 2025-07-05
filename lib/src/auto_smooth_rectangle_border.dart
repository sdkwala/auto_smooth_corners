import 'package:flutter/material.dart';
import 'auto_smooth_border_radius.dart';

/// A ShapeBorder that draws a rectangle with smooth (squircle-like) corners.
class AutoSmoothRectangleBorder extends ShapeBorder {
  final double smoothingFactor;
  final AutoSmoothBorderRadius? autoSmoothBorderRadius;
  final BorderSide side;

  const AutoSmoothRectangleBorder({
    double? smoothingFactor,
    this.autoSmoothBorderRadius,
    this.side = BorderSide.none,
  }) : smoothingFactor = smoothingFactor ?? 0.6; // Default value, can be overridden by SmoothCornerConfig

  /// Returns the effective smoothing for each corner as a map,
  /// given the current width and height.
  Map<String, double> effectiveCornerRadii(Size size) {
    final minDim = size.width < size.height ? size.width : size.height;
    final radius = autoSmoothBorderRadius;
    if (radius != null) {
      return {
        'topLeft': radius.topLeft * minDim,
        'topRight': radius.topRight * minDim,
        'bottomLeft': radius.bottomLeft * minDim,
        'bottomRight': radius.bottomRight * minDim,
      };
    } else {
      // Get the effective smoothing factor from the widget or global config
      final effectiveSmoothingFactor = smoothingFactor;
      final r = effectiveSmoothingFactor * minDim;
      return {
        'topLeft': r,
        'topRight': r,
        'bottomLeft': r,
        'bottomRight': r,
      };
    }
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) {
    return AutoSmoothRectangleBorder(
      smoothingFactor: smoothingFactor * t,
      autoSmoothBorderRadius: autoSmoothBorderRadius == null
          ? null
          : AutoSmoothBorderRadius.only(
              topLeft: autoSmoothBorderRadius!.topLeft * t,
              topRight: autoSmoothBorderRadius!.topRight * t,
              bottomLeft: autoSmoothBorderRadius!.bottomLeft * t,
              bottomRight: autoSmoothBorderRadius!.bottomRight * t,
            ),
      side: side.scale(t),
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final radii = effectiveCornerRadii(rect.size);
    return Path()
      ..addRRect(RRect.fromRectAndCorners(
        rect,
        topLeft: Radius.circular(radii['topLeft'] ?? 0),
        topRight: Radius.circular(radii['topRight'] ?? 0),
        bottomLeft: Radius.circular(radii['bottomLeft'] ?? 0),
        bottomRight: Radius.circular(radii['bottomRight'] ?? 0),
      ));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // For now, same as outer path
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side == BorderSide.none) return;
    final path = getOuterPath(rect, textDirection: textDirection);
    final paint = side.toPaint();
    canvas.drawPath(path, paint);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutoSmoothRectangleBorder &&
          runtimeType == other.runtimeType &&
          smoothingFactor == other.smoothingFactor &&
          autoSmoothBorderRadius == other.autoSmoothBorderRadius &&
          side == other.side;

  @override
  int get hashCode =>
      smoothingFactor.hashCode ^
      autoSmoothBorderRadius.hashCode ^
      side.hashCode;

  @override
  String toString() =>
      'AutoSmoothRectangleBorder(smoothingFactor: $smoothingFactor, autoSmoothBorderRadius: $autoSmoothBorderRadius, side: $side)';
}
