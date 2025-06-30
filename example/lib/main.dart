import 'package:flutter/material.dart';
import 'package:auto_smooth_corners/auto_smooth_corners.dart';
import 'dart:math';

void main() => runApp(const SmoothDemoApp());

class SmoothDemoApp extends StatelessWidget {
  const SmoothDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoSmoothCorners Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SmoothDemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SmoothDemoPage extends StatefulWidget {
  const SmoothDemoPage({super.key});

  @override
  State<SmoothDemoPage> createState() => _SmoothDemoPageState();
}

class _SmoothDemoPageState extends State<SmoothDemoPage> {
  double smoothing = 0.25;
  double borderRadius = 24.0;

  void _reset() {
    setState(() {
      smoothing = 0.25;
      borderRadius = 24.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const double demoWidth = 100;
    const double demoHeight = 60;
    final double borderRadiusFactor = borderRadius / min(demoWidth, demoHeight);

    return Scaffold(
      appBar: AppBar(title: const Text('AutoSmoothCorners Demo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section: Controls
            const Text(
              'Corner Controls',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Smoothing Factor: ${(smoothing * 100).toStringAsFixed(0)}%'),
            Slider(
              value: smoothing,
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label: (smoothing * 100).toStringAsFixed(0),
              onChanged: (v) => setState(() => smoothing = v),
            ),
            const Text(
              'Controls the "smoothness" of the corners. 0% = sharp, 100% = max squircle.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Text('BorderRadius (px): ${borderRadius.toStringAsFixed(0)}'),
            Slider(
              value: borderRadius,
              min: 0.0,
              max: 60.0,
              divisions: 60,
              label: borderRadius.toStringAsFixed(0),
              onChanged: (v) => setState(() => borderRadius = v),
            ),
            const Text(
              'Controls the standard border radius (in px) for all widgets.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset'),
              ),
            ),
            const Divider(height: 32, thickness: 2),
            // Section: Comparison
            const Text(
              'Comparison: Normal vs. Smooth Corners',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Normal Container
                  _DemoColumn(
                    label: 'Normal (BorderRadius)',
                    child: Container(
                      width: demoWidth,
                      height: demoHeight,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: const Center(
                          child: Text('Normal',
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  // Smooth Container
                  _DemoColumn(
                    label: 'Smooth',
                    child: AutoSmoothContainer(
                      width: demoWidth,
                      height: demoHeight,
                      color: Colors.blue,
                      smoothingFactor: smoothing,
                      autoSmoothBorderRadius:
                          AutoSmoothBorderRadius.all(borderRadiusFactor),
                      child: const Center(
                          child: Text('Smooth',
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  // Normal Card
                  _DemoColumn(
                    label: 'Normal (BorderRadius)',
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: const SizedBox(
                        width: demoWidth,
                        height: demoHeight,
                        child: Center(child: Text('Normal')),
                      ),
                    ),
                  ),
                  // Smooth Card
                  _DemoColumn(
                    label: 'Smooth',
                    child: AutoSmoothCard(
                      color: Colors.white,
                      elevation: 4,
                      smoothingFactor: smoothing,
                      autoSmoothBorderRadius:
                          AutoSmoothBorderRadius.all(borderRadiusFactor),
                      child: const SizedBox(
                        width: demoWidth,
                        height: demoHeight,
                        child: Center(child: Text('Card')),
                      ),
                    ),
                  ),
                  // Normal ClipRRect
                  _DemoColumn(
                    label: 'Normal (BorderRadius)',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Image.network(
                        'https://placekitten.com/100/100',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Smooth ClipRRect
                  _DemoColumn(
                    label: 'Smooth',
                    child: AutoSmoothClipRRect(
                      smoothingFactor: smoothing,
                      autoSmoothBorderRadius:
                          AutoSmoothBorderRadius.all(borderRadiusFactor),
                      child: Image.network(
                        'https://placekitten.com/100/100',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Section: Per-corner demo
            const Text(
              'Per-corner Smoothing Example',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can set different smoothing values for each corner:',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Center(
              child: AutoSmoothContainer(
                width: 180,
                height: 60,
                color: Colors.green,
                autoSmoothBorderRadius: AutoSmoothBorderRadius.only(
                  topLeft: smoothing,
                  topRight: smoothing / 2,
                  bottomLeft: 0.0,
                  bottomRight: smoothing,
                ),
                child: const Center(
                    child: Text('Per-corner',
                        style: TextStyle(color: Colors.white))),
              ),
            ),
            const SizedBox(height: 32),
            // Section: Developer Notes
            const Divider(thickness: 1),
            const Text(
              'Developer Notes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              '• "Normal (BorderRadius)" uses standard Flutter circular corners.\n'
              '• "Smooth" uses AutoSmoothCorners for iOS-style smooth corners.\n'
              '• Both sliders affect all widgets for direct comparison.\n'
              '• Try setting Smoothing to 0% to see only the effect of BorderRadius.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper widget for consistent demo columns
class _DemoColumn extends StatelessWidget {
  final String label;
  final Widget child;
  const _DemoColumn({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          child,
        ],
      ),
    );
  }
}
