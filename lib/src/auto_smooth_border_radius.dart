/// Holds per-corner smoothing factors for smooth corners.
class AutoSmoothBorderRadius {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  /// Creates a border radius where all corners have the same smoothing factor.
  const AutoSmoothBorderRadius.all(double value)
      : topLeft = value,
        topRight = value,
        bottomLeft = value,
        bottomRight = value;

  /// Creates a border radius with only the specified corners set.
  const AutoSmoothBorderRadius.only({
    this.topLeft = 0.0,
    this.topRight = 0.0,
    this.bottomLeft = 0.0,
    this.bottomRight = 0.0,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AutoSmoothBorderRadius &&
          runtimeType == other.runtimeType &&
          topLeft == other.topLeft &&
          topRight == other.topRight &&
          bottomLeft == other.bottomLeft &&
          bottomRight == other.bottomRight;

  @override
  int get hashCode =>
      topLeft.hashCode ^
      topRight.hashCode ^
      bottomLeft.hashCode ^
      bottomRight.hashCode;

  @override
  String toString() =>
      'AutoSmoothBorderRadius(topLeft: $topLeft, topRight: $topRight, bottomLeft: $bottomLeft, bottomRight: $bottomRight)';
}
