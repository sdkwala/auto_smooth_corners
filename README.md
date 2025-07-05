# auto_smooth_corners

![Demo: Normal vs. Smooth Corners](assets/image.png)

A Flutter package for highly customizable, dynamic smooth corners (iOS-style squircle) with per-corner control.

## Features
- Dynamic smoothing: `smoothingFactor` scales with widget size
- Per-corner smoothing: `AutoSmoothBorderRadius.only(...)`
- Drop-in widgets: `AutoSmoothContainer`, `AutoSmoothClipRRect`, `AutoSmoothCard`
- Global configuration: Set default smooth corner settings app-wide
- Easy integration with existing Flutter widgets
- MIT licensed and open source

## Getting Started
Add to your `pubspec.yaml`:
```yaml
dependencies:
  auto_smooth_corners:
    path: ./
```

Import in your Dart code:
```dart
import 'package:auto_smooth_corners/auto_smooth_corners.dart';
```

## Basic Example
```dart
import 'package:flutter/material.dart';
import 'package:auto_smooth_corners/auto_smooth_corners.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child: AutoSmoothContainer(
            width: 120,
            height: 60,
            color: Colors.blue,
            smoothingFactor: 0.25, // 25% of min(width, height)
            autoSmoothBorderRadius: AutoSmoothBorderRadius.all(0.2),
            child: const Center(child: Text('Smooth Container', style: TextStyle(color: Colors.white))),
          ),
        ),
      ),
    );
  }
}
```

## Global Configuration

You can set global default values for smooth corners that will be used throughout your app:

```dart
void main() {
  runApp(
    SmoothCornerProvider(
      defaultSmoothingFactor: 0.8, // Default smoothness for all widgets
      defaultAutoSmoothBorderRadius: AutoSmoothBorderRadius.all(0.2), // Default border radius
      child: const MyApp(),
    ),
  );
}
```

Individual widgets can still override these defaults:

```dart
AutoSmoothContainer(
  width: 120,
  height: 60,
  color: Colors.blue,
  smoothingFactor: 0.5, // Override global default
  child: const Text('Custom Smoothing'),
)
```

## API Reference

### Widgets
- `AutoSmoothContainer`: Like `Container`, but with smooth corners
- `AutoSmoothClipRRect`: Like `ClipRRect`, but with smooth corners
- `AutoSmoothCard`: Like `Card`, but with smooth corners

### Global Configuration
- `SmoothCornerProvider`: Widget to provide global smooth corner configuration
- `SmoothCornerConfig`: Configuration class for global smooth corner settings

### Advanced
- `AutoSmoothRectangleBorder`: Custom `ShapeBorder` for advanced use
- `AutoSmoothBorderRadius`: Per-corner smoothing factors

## License
MIT

