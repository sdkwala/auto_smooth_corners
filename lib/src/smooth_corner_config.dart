import 'package:flutter/material.dart';
import 'auto_smooth_border_radius.dart';

/// Global configuration for smooth corners in the app.
///
/// This class allows you to set default values for smooth corners that will be
/// used throughout your app, unless overridden locally.
class SmoothCornerConfig extends InheritedWidget {
  /// The default smoothing factor to use for smooth corners.
  final double defaultSmoothingFactor;

  /// The default border radius to use for smooth corners.
  final AutoSmoothBorderRadius? defaultAutoSmoothBorderRadius;

  /// Creates a configuration for smooth corners.
  const SmoothCornerConfig({
    super.key,
    required this.defaultSmoothingFactor,
    this.defaultAutoSmoothBorderRadius,
    required super.child,
  });

  /// The default configuration, which uses a smoothing factor of 0.6.
  static const SmoothCornerConfig defaults = SmoothCornerConfig(
    defaultSmoothingFactor: 0.6,
    child: SizedBox.shrink(),
  );

  /// The configuration from the closest instance of this class that encloses
  /// the given context.
  ///
  /// If there is no [SmoothCornerConfig] in scope, returns the default
  /// configuration.
  static SmoothCornerConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SmoothCornerConfig>() ?? defaults;
  }

  @override
  bool updateShouldNotify(covariant SmoothCornerConfig oldWidget) {
    return defaultSmoothingFactor != oldWidget.defaultSmoothingFactor ||
        defaultAutoSmoothBorderRadius != oldWidget.defaultAutoSmoothBorderRadius;
  }

  /// Creates a copy of this configuration with the given fields replaced
  /// by the new values.
  SmoothCornerConfig copyWith({
    double? defaultSmoothingFactor,
    AutoSmoothBorderRadius? defaultAutoSmoothBorderRadius,
    Widget? child,
  }) {
    return SmoothCornerConfig(
      defaultSmoothingFactor: defaultSmoothingFactor ?? this.defaultSmoothingFactor,
      defaultAutoSmoothBorderRadius: defaultAutoSmoothBorderRadius ?? this.defaultAutoSmoothBorderRadius,
      child: child ?? this.child,
    );
  }
}

/// A widget that provides smooth corner configuration to its descendants.
///
/// Wrap your app with this widget to provide global smooth corner configuration.
///
/// Example:
/// ```dart
/// void main() {
///   runApp(
///     SmoothCornerProvider(
///       defaultSmoothingFactor: 0.8,
///       child: MyApp(),
///     ),
///   );
/// }
/// ```
class SmoothCornerProvider extends StatelessWidget {
  /// The default smoothing factor to use for smooth corners.
  final double defaultSmoothingFactor;

  /// The default border radius to use for smooth corners.
  final AutoSmoothBorderRadius? defaultAutoSmoothBorderRadius;

  /// The widget below this widget in the tree.
  final Widget child;

  /// Creates a widget that provides smooth corner configuration.
  const SmoothCornerProvider({
    super.key,
    this.defaultSmoothingFactor = 0.6,
    this.defaultAutoSmoothBorderRadius,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothCornerConfig(
      defaultSmoothingFactor: defaultSmoothingFactor,
      defaultAutoSmoothBorderRadius: defaultAutoSmoothBorderRadius,
      child: child,
    );
  }
}
