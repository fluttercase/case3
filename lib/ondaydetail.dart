import 'package:flutter/material.dart';
import 'package:customslider/ChartData.dart';
import 'package:customslider/cards.dart';

class OnedayDetail extends StatefulWidget {
  OnedayDetail({Key key}) : super(key: key);

  _OnedayDetailState createState() => _OnedayDetailState();
}

class _OnedayDetailState extends State<OnedayDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/person.jpg'),
                        radius: 30,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          text: '9764 ',
                          style: TextStyle(fontSize: 30, color: Color(0xFF002459), fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(text: 'Steps', style: TextStyle(fontSize: 16, color: Colors.grey))
                          ]
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: '8763',
                          style: TextStyle(fontSize: 20, color: Color(0xFF002459),),
                          children: [
                            TextSpan(text: ' m', style: TextStyle(fontSize: 16, color: Colors.grey)),
                            TextSpan(text: ' 1245',style: TextStyle(fontSize: 20, color: Color(0xFF002459),),),
                            TextSpan(text: ' kcal ', style: TextStyle(fontSize: 16, color: Colors.grey)),
                          ]
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  height: 300,
                  // color: Colors.pinkAccent,
                  child: CustomPaint(
                    foregroundPainter: ChartData(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CardPage(),
                )
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.blue),
              ),
            )
          ],
        ),
      ),
    );
  }
}