import 'package:flutter/material.dart';
import 'package:mind_task_app/core/themes/colors.dart';
import 'dart:math' as math;

class HexagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
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

class HexagonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
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
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
