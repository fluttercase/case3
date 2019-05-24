import 'dart:math';

import 'package:flutter/material.dart';

class BasePainter extends CustomPainter {
  Color baseColor;
  Offset center;
  double radius;
  double completePercent;
  double width;
  Color foreColor;
  BasePainter({
    @required this.baseColor,
    this.foreColor = Colors.greenAccent,
    this.completePercent = 0,
    this.width = 2});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
          ..color = foreColor
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = width;


    Paint circlepaint = Paint()
          ..color = baseColor
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = width;

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2);

    // canvas.drawCircle(center, radius, paint);
    double arcAngle = 2*pi* (completePercent/100);
    canvas.drawCircle(center, radius, circlepaint);
    canvas.drawArc(
        new Rect.fromCircle(center: center,radius: radius),
        -pi/3,
        arcAngle,
        false,
        paint
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}