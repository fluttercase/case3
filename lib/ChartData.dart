import 'dart:math';

import 'package:flutter/material.dart';


class ChartData extends CustomPainter {
  List<String> xAxisLabels = ['D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7'];
  List<String> yAxisLabels = ['0', '3000', '4000', '5000', '6000'];
  @override
  void paint(Canvas canvas, Size size) {
    print('$size');
    var height = size.height;
    var space = height / (yAxisLabels.length + 1);

    Paint p = Paint()
      ..color = Colors.grey.withAlpha(80);

    var index = 0.0;
    yAxisLabels.forEach((item){
      TextSpan span = new TextSpan(style: new TextStyle(color: Colors.grey), text: item);
      TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      tp.layout();
      index += space;
      tp.paint(canvas, new Offset(0, height - index)); 

      canvas.drawLine( Offset(space + 5, height - index + 10), Offset(size.width , height - index+ 10), p);
    });


    var last = index;
    index = 0;
    var spaceWidth = size.width / (xAxisLabels.length + 1);
    xAxisLabels.forEach((item){
      TextSpan span = new TextSpan(style: new TextStyle(color: Colors.grey), text: item);
      TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.left, textDirection: TextDirection.ltr);
      tp.layout();
      index += spaceWidth;
      tp.paint(canvas, new Offset(index, height - 20));

      canvas.drawLine( Offset(index + 10, height - last), Offset(index + 10, height - space + 10), p);
    });
    
    Paint pline = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = Colors.blue[900];

    List<Offset> fs = [
      Offset(spaceWidth + 10, height-space * 2 + 10),
      Offset(spaceWidth * 2 + 10, height - space * 3 + 10),
      Offset(spaceWidth * 3 + 10, height-space * 2 -20),
      Offset(spaceWidth * 4 + 10, height-space ),
      Offset(spaceWidth * 5 + 10, height-space * 4),
      Offset(spaceWidth * 6 + 10, height-space * 3 + 10),
      Offset(spaceWidth * 7 + 10, height-space* 3),
    ];
    var path = Path();
    path.moveTo(fs.first.dx , fs.first.dy);
    fs.removeAt(0);

    fs.forEach((item) {
      // path.quadraticBezierTo(0, 0, item.dx, item.dy);
      path.lineTo(item.dx, item.dy);
    });
    
    canvas.drawPath(path, pline);

    pline.style = PaintingStyle.fill;
    pline.color = Colors.blue[900];
    canvas.drawCircle(fs[1], 9, pline);
    pline.color = Colors.white;
    canvas.drawCircle(fs[1], 4, pline);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}