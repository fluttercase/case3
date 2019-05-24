import 'package:flutter/material.dart';

class TabSlider extends StatefulWidget {
  TabSlider({Key key}) : super(key: key);

  _TabSliderState createState() => _TabSliderState();
}

class _TabSliderState extends State<TabSlider> {
  int selectedTab = 0;
  double sliderValue1 = 30;
  double sliderValue3 = 68;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                LabelTab(
                  selected: selectedTab == 0,
                  title: 'Daily',
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  }
                ),
                LabelTab(
                  selected: selectedTab == 1,
                  title: 'Weekly',
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  }
                ),
                LabelTab(
                  selected: selectedTab == 2,
                  title: 'Monthly',onTap: () {
                  setState(() {
                    selectedTab = 2;
                  });
                })
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 6),
              child: Text('Lose Wdight', style: TextStyle(color: Color(0xFF002459)),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Slider(
                    activeColor: Colors.greenAccent,
                    value: sliderValue1,
                    max: 100,
                    min: 0,
                    onChanged: (v) {
                      setState(() {
                        sliderValue1 = v;
                      });
                    },
                  ),
                ),
                Text('${sliderValue1.toStringAsFixed(0)}%', )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 6),
              child: Text('Lose Wdight', style: TextStyle(color: Color(0xFF002459)),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Slider(
                    activeColor: Color(0xFF002459),
                    value: sliderValue3,
                    max: 100,
                    min: 0,
                    onChanged: (v) {
                      setState(() {
                        sliderValue3 = v;
                      });
                    },
                  ),
                ),
                Text('${sliderValue3.toStringAsFixed(0)}%', )
              ],
            )
         ],
       ),
    );
  }
}

typedef void OnTap();
class LabelTab extends StatelessWidget {
  final bool selected;
  final String title;
  final OnTap onTap;
  const LabelTab({Key key, this.selected, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Column(
          children: <Widget>[
            Text(title, style: TextStyle(color: selected ? Color(0xFF002459) : Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),),
            Visibility(
              visible: selected,
              child: Container(
                margin: EdgeInsets.only(top: 6),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFF002459)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}