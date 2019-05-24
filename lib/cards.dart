import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  CardPage({Key key}) : super(key: key);

  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  List<int> _list = List.generate(5, (i) => i);
  @override
  Widget build(BuildContext context) {
    
    
    return LayoutBuilder(
      builder: (c, b) {

        return Stack(
          children: <Widget>[
            Container(
              height: 400,
            ),
            Positioned(
              left: 0,
              bottom: 50,
              top: 20,
              width: b.maxWidth,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('1'),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 30,
              top: 10,
              width: b.maxWidth - 10,
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('1'),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 20,
              top: 0,
              width: b.maxWidth - 20,
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Hello Adam', style: TextStyle(color: Colors.white, fontSize: 20),),                    
                          RaisedButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            elevation: 0,
                            highlightElevation: 0,
                            color: Colors.white.withAlpha(50),
                            onPressed: (){},
                            child: Text('Try the Pro', style: TextStyle(color: Colors.white, fontSize: 16)),
                          )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }
    );
  }
  // _g (double w) {
  //   return _list.map((i){
  //     return Positioned(
  //       left: 0,
  //       bottom: 30,
  //       top: 10,
  //       width: whitespaceTextConfiguration - 10,
  //       child: Container(
  //         decoration: BoxDecoration(
  //           color: Colors.blueAccent
  //         ),
  //         child: Text('1'),
  //       ),
  //     );
  //   }).toList();
  // }
}