# auto_smooth_corners

![Demo: Normal vs. Smooth Corners](assets/image.png)

A Flutter package for highly customizable, dynamic smooth corners (iOS-style squircle) with per-corner control.

## Features
- Dynamic smoothing: `smoothingFactor` scales with widget size
- Per-corner smoothing: `AutoSmoothBorderRadius.only(...)`
- Drop-in widgets: `AutoSmoothContainer`, `AutoSmoothClipRRect`, `AutoSmoothCard`
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

## Example
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

## API Reference
- `AutoSmoothContainer`: Like `Container`, but with smooth corners
- `AutoSmoothClipRRect`: Like `ClipRRect`, but with smooth corners
- `AutoSmoothCard`: Like `Card`, but with smooth corners
- `AutoSmoothRectangleBorder`: Custom `ShapeBorder` for advanced use
- `AutoSmoothBorderRadius`: Per-corner smoothing factors

## License
MIT

## Author
Zahir Badi ([LinkedIn](https://www.linkedin.com/in/zahirabbasbadi/))
