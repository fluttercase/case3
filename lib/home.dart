import 'package:flutter/material.dart';
import 'package:customslider/BasePainter.dart';
import 'package:customslider/CircleSlider.dart';
import 'package:customslider/tbadate.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              DateChart(title: 'Mon', baseColor: Colors.green[50], foreColor: Colors.greenAccent, completePercent: 70, onTap: _onTap),
              DateChart(title: 'Thu', baseColor: Colors.blue[50],foreColor: Colors.blueAccent, completePercent: 60, onTap: _onTap),
              DateChart(title: 'Wed', baseColor: Colors.green[50],foreColor: Colors.greenAccent, completePercent: 50, onTap: _onTap),
              DateChart(title: 'Thrs',baseColor: Colors.blue[50],foreColor: Colors.blueAccent, completePercent: 65, onTap: _onTap),
              DateChart(title: 'Fri', baseColor: Colors.green[50],foreColor: Colors.greenAccent, completePercent: 44, onTap: _onTap),
              DateChart(title: 'Sat', baseColor: Colors.blue[50],foreColor: Colors.blueAccent, completePercent: 30, onTap: _onTap),
              DateChart(title: 'Sun', baseColor: Colors.green[50],foreColor: Colors.greenAccent, completePercent: 60, onTap: _onTap)
            ],
          ),
        ),
        CircleSlider(),
        TabSlider()
      ],
    );
  }
  _onTap (String type) {
    print('$type');
    Navigator.of(context).pushNamed('detail');
  }
}

typedef void OnTap(String type);
class DateChart extends StatelessWidget {
  final String title;
  final Color foreColor;
  final Color baseColor;
  final double completePercent;
  final OnTap onTap;
  const DateChart({
    Key key,
    this.title,
    this.foreColor,
    this.baseColor,
    this.completePercent = 0,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(title);
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: <Widget>[
          CustomPaint(
            foregroundPainter: BasePainter(
              baseColor: baseColor,
              foreColor: foreColor,
              completePercent: completePercent, width: 3
            ),
            child: Container(height: 30.0, width: 30.0,),
          ),
          SizedBox(height: 10,),
          Text(title)
        ],
      ),
    );
  }
}