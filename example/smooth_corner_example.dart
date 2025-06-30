import 'package:flutter/material.dart';
import 'package:auto_smooth_corners/auto_smooth_corners.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Corner Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SmoothCornerDemo(),
    );
  }
}

class SmoothCornerDemo extends StatelessWidget {
  const SmoothCornerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smooth Corner Demo'),
      ),
      body: Center(
        child: AutoSmoothContainer(
          width: 200,
          height: 100,
          color: Colors.blue,
          smoothingFactor: 0.8,
          autoSmoothBorderRadius: AutoSmoothBorderRadius.all(0.2),
          child: const Center(
            child: Text(
              'Smooth Corner!',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
