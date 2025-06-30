# Smooth Corner SDK

[![pub package](https://img.shields.io/pub/v/smooth_corner_sdk.svg)](https://pub.dev/packages/smooth_corner_sdk)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)
[![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://pub.dev/packages/effective_dart)

A Flutter package for creating beautiful, customizable smooth corners (iOS-style squircle) with full control over corner styling and animations.

## Features ✨

- 🎨 **Highly Customizable** - Control every aspect of corner styling
- ⚡ **Performance Optimized** - Built with Flutter's custom painters for smooth animations
- 📱 **Responsive** - Smooth corners that scale beautifully across different screen sizes
- 🎯 **Precision Control** - Adjust corner radius and smoothing factor independently
- 🎭 **Multiple Widgets** - Includes ready-to-use widgets like `SmoothContainer` and `SmoothCard`
- 🎨 **Theming Support** - Easily integrate with your app's theme

## 📦 Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  smooth_corner_sdk: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

Import the package:

```dart
import 'package:smooth_corner_sdk/smooth_corner_sdk.dart';
```

### Basic Usage

```dart
SmoothContainer(
  width: 200,
  height: 200,
  color: Colors.blue,
  borderRadius: BorderRadius.circular(20),
  smoothFactor: 0.8, // Adjust smoothness (0.0 to 1.0)
  child: const Center(
    child: Text('Smooth Corners!', style: TextStyle(color: Colors.white)),
  ),
)
```

## 🎨 Customization

### Smoothness Control

```dart
SmoothContainer(
  // ...
  smoothFactor: 0.8, // 0.0 = sharp corners, 1.0 = maximum smoothness
)
```

### Per-Corner Smoothing

```dart
SmoothContainer(
  // ...
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20),
    bottomRight: Radius.circular(40),
  ),
  smoothFactor: 0.7,
)
```

### Animations

```dart
AnimatedSmoothContainer(
  duration: const Duration(milliseconds: 300),
  width: _isExpanded ? 200 : 100,
  height: _isExpanded ? 200 : 100,
  color: Colors.blue,
  borderRadius: BorderRadius.circular(20),
  smoothFactor: _isExpanded ? 0.9 : 0.5,
)
```

## 📚 Widgets

### SmoothContainer

A container with smooth corners that extends `Container` with additional smooth corner properties.

### SmoothCard

A card widget with smooth corners that extends `Card`.

### SmoothClipRRect

A clip widget with smooth corners that extends `ClipRRect`.

## 🛠️ Advanced Usage

### Custom Painter

For custom implementations, use `SmoothCornerPainter`:

```dart
CustomPaint(
  painter: SmoothCornerPainter(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(20),
    smoothFactor: 0.8,
  ),
  child: const Center(child: Text('Custom Painter')),
)
```

## 📱 Example App

Check out the `example` directory for a complete example app demonstrating various use cases.

## 🔧 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📬 Get in Touch

Have questions or suggestions? Feel free to [open an issue](https://github.com/zahir-patel/auto_smooth_corners/issues)!

## 📚 API Reference
- `AutoSmoothContainer`: Like `Container`, but with smooth corners
- `AutoSmoothClipRRect`: Like `ClipRRect`, but with smooth corners
- `AutoSmoothCard`: Like `Card`, but with smooth corners
- `AutoSmoothRectangleBorder`: Custom `ShapeBorder` for advanced use
- `AutoSmoothBorderRadius`: Per-corner smoothing factors

## License
MIT

## Author
Zahir Badi ([LinkedIn](https://www.linkedin.com/in/zahirabbasbadi/))

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
