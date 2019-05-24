import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:customslider/home.dart';
import 'package:customslider/ondaydetail.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        'detail': (c) => OnedayDetail()
      },
      home: MyHomePage(title: 'This Week'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  double percentage = 0.0;
  int currentIndex = 0;
  PageController _pageCtrl = new PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RichText(
              text: TextSpan(children: [
                TextSpan(text: 'This', style: TextStyle(color: Colors.black87, fontSize: 20)),
                TextSpan(text: ' Week', style: TextStyle(color: Colors.black, fontSize: 20))
              ]),
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/person.jpg'),
              radius: 24,
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageCtrl,
        children: <Widget>[
          HomePage(),
          Text('sd'),
          Text('sd'),
          Text('sd'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueAccent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timelapse),
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Food')),
          BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('Sport')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('Training')),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            
          });
          print('object: $_pageCtrl');
        },
      )
    );
  }
}
