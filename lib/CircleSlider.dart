import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircleSlider extends StatefulWidget {
  CircleSlider({Key key}) : super(key: key);

  _CircleSliderState createState() => _CircleSliderState();
}

class _CircleSliderState extends State<CircleSlider> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width / 1.6;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: width,
          width: width,
          child: CustomPaint(
            size: Size(width, width),
            foregroundPainter: _CustomPainter(completePercent: 70),
             child: RaisedButton(
               color: Colors.white,
               highlightElevation: 0,
               elevation: 0,
               onPressed: (){
                 Navigator.of(context).pushNamed('detail');
               },
               shape: CircleBorder(),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text('981', style: TextStyle(fontSize: 80),),
                   Text('Burned calories',  style: TextStyle(fontSize: 13, color: Colors.grey[700]),)
                 ],
               ),
             ),
           ),
        ),
      ],
    );
  }
}

class _CustomPainter extends CustomPainter{
  double width = 18;
  double completePercent;
  _CustomPainter({this.completePercent = 60});
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(size.width / 2, size.height / 2);
    var radius = min(size.width / 2, size.height / 2);

    Paint backPaint = Paint()
    ..color = Color(0xFFEAFEF9)
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    ..strokeWidth = width;

    var rect = Rect.fromCircle(center: center, radius: radius);

    var angleoffset = asin(width * 0.5 / radius);
    double startAngle = angleoffset;
    double arcAngle = 2*pi* (completePercent/100) ;


    Paint forePaint = new Paint()
    ..strokeCap = StrokeCap.round
    ..style = PaintingStyle.stroke
    // ..maskFilter = MaskFilter.
    ..shader = getGradient().createShader(rect)
    ..strokeWidth = width;

    canvas.drawCircle(center, radius, backPaint);
 
    canvas.drawArc(
        rect,
        startAngle,
        arcAngle - angleoffset,
        false,
        forePaint
    );

    Paint p = Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.white;
    var s = sin(arcAngle) * radius;
    var c = cos(arcAngle) * radius;
    var dotcenter = Offset((-size.width / 2 - c).abs(), (-size.width / 2 - s).abs());
    canvas.drawCircle(dotcenter, 5, p);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  Gradient getGradient () {
    final gradient = new SweepGradient(
      startAngle: 0,
      endAngle: 2*pi,
      tileMode: TileMode.repeated,
      colors: [Color(0x33000DDB2), Color(0xFF00DDB2)],
    );
    return gradient;
  }
}