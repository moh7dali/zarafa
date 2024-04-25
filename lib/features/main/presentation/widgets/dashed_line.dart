import 'package:flutter/material.dart';

class DashedLineVerticalPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedLineVerticalPainter({
    required this.color,
    this.dashWidth = 5.0,
    this.dashSpace = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;
    double startY = 0.0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0.0, startY), Offset(0.0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}