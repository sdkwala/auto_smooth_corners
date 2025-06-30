<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages). 
-->

# auto_smooth_corners

A Flutter package for highly customizable, dynamic smooth corners (iOS-style squircle) with per-corner control.

## Features
- Dynamic smoothing: `smoothingFactor` scales with widget size
- Per-corner smoothing: `AutoSmoothBorderRadius.only(...)`
- Drop-in widgets: `AutoSmoothContainer`, `AutoSmoothClipRRect`, `AutoSmoothCard`

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

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

### Example: Minimal Flutter App
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AutoSmoothContainer with global smoothing
              AutoSmoothContainer(
                width: 120,
                height: 60,
                color: Colors.blue,
                smoothingFactor: 0.25, // 25% of min(width, height)
                child: const Center(child: Text('Smooth Container', style: TextStyle(color: Colors.white))),
              ),
              const SizedBox(height: 24),
              // AutoSmoothContainer with per-corner smoothing
              AutoSmoothContainer(
                width: 120,
                height: 60,
                color: Colors.green,
                autoSmoothBorderRadius: AutoSmoothBorderRadius.only(
                  topLeft: 0.5, // 50% smoothing on topLeft
                  bottomRight: 0.1, // 10% on bottomRight
                ),
                child: const Center(child: Text('Per-corner', style: TextStyle(color: Colors.white))),
              ),
              const SizedBox(height: 24),
              // AutoSmoothClipRRect
              AutoSmoothClipRRect(
                smoothingFactor: 0.3,
                child: Image.network(
                  'https://placekitten.com/200/200',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),
              // AutoSmoothCard
              AutoSmoothCard(
                color: Colors.white,
                elevation: 4,
                smoothingFactor: 0.2,
                child: const SizedBox(
                  width: 120,
                  height: 60,
                  child: Center(child: Text('Smooth Card')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

## Additional information

TODO: Tell users more about the package: where to find more information, how to 
contribute to the package, how to file issues, what response they can expect 
from the package authors, and more.
