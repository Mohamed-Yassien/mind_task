import 'package:flutter/material.dart';
import 'package:mind_task_app/core/shared/hexagon_painter.dart';

class Hexagon extends StatelessWidget {
  const Hexagon({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100), // Adjust size as needed
      painter: HexagonPainter(),
    );
  }
}
