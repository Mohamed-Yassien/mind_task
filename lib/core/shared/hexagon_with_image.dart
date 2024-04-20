import 'package:flutter/material.dart';
import 'package:mind_task_app/core/shared/hexagon.dart';
import 'package:mind_task_app/core/shared/hexagon_painter.dart';

class HexagonWithImage extends StatelessWidget {
  const HexagonWithImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100, // Adjust size as needed
      height: 100, // Adjust size as needed
      child: Stack(
        children: [
          const Hexagon(),
          Positioned.fill(
            child: ClipPath(
              clipper: HexagonClipper(),
              child: Image.network(
                'https://via.placeholder.com/150', // Replace with your image URL
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
