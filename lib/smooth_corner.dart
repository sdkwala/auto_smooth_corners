/// A Flutter package for creating smooth, customizable corners in your UI with support for various corner styles and animations.
///
/// This package provides several widgets that can be used to create smooth corners:
/// - [AutoSmoothContainer]: A container with smooth corners
/// - [AutoSmoothCard]: A card with smooth corners
/// - [AutoSmoothClipRRect]: A clip rectangle with smooth corners
/// - [AutoSmoothBorderRadius]: A border radius with smooth corners
/// - [AutoSmoothRectangleBorder]: A rectangle border with smooth corners
/// - [SmoothCornerProvider]: A widget to provide global smooth corner configuration
/// - [SmoothCornerConfig]: Configuration class for global smooth corner settings
library smooth_corner_sdk;

export 'src/smooth_corner_base.dart';
export 'src/auto_smooth_border_radius.dart';
export 'src/auto_smooth_rectangle_border.dart';
export 'src/auto_smooth_container.dart';
export 'src/auto_smooth_clip_rrect.dart';
export 'src/auto_smooth_card.dart';
export 'src/smooth_corner_config.dart';

// Additional exports for global configuration
export 'src/smooth_corner_config.dart' show SmoothCornerProvider, SmoothCornerConfig;
