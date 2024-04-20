import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AppColors {
  static Color primary = const Color(0xffFBD203);
  static Color borderColor = const Color(0xff757575);
  static Color hintColor = const Color(0xffA7A7A7);
}

class Hexagon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(100, 100), // Adjust size as needed
      painter: HexagonPainter(),
    );
  }
}

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.primary; // Change color as needed
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = math.min(size.width / 2, size.height / 2);

    Path path = Path();

    for (int i = 0; i < 6; i++) {
      double angle = (math.pi / 3) * i;
      double x = centerX + radius * math.cos(angle);
      double y = centerY + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Hexagonal Shape'),
      ),
      body: Center(
        child: Hexagon(),
      ),
    ),
  ));
}
