// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class customStyleArrow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0XFFC8D8FE)
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;
    const double triangleH = 10;
    const double triangleW = 25.0;
    final double width = size.width;
    final double height = size.height;

    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, height)
      ..lineTo(width / 2, triangleH + height)
      ..lineTo(width / 2 + triangleW / 2, height)
      ..lineTo(width / 2 - triangleW / 2, height);
    canvas.drawPath(trianglePath, paint);
    final BorderRadius borderRadius = BorderRadius.circular(15);
    final Rect rect = Rect.fromLTRB(0, 0, width, height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
