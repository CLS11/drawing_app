import 'dart:ui';

import 'package:flutter/material.dart';

class FlipbookPainter extends CustomPainter {
  FlipbookPainter(this.offsets) : super();
  final List<Offset> offsets;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple
      ..isAntiAlias = true
      ..strokeWidth = 3.0;

    for (var i = 0; i < offsets.length; i++) {
      if (offsets[i] != null && offsets[i + 1] != null) {
        canvas.drawLine(offsets[i], offsets[i + 1], paint);
      } else if (offsets[i] != null && offsets[i + 1] == null) {
        canvas.drawPoints(PointMode.points, [offsets[i]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
