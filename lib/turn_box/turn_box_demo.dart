import 'package:flutter/material.dart';

import 'turn_box.dart';

class TurnBoxDemo extends StatefulWidget {
  @override
  _TurnBoxDemoState createState() => new _TurnBoxDemoState();
}

class _TurnBoxDemoState extends State<TurnBoxDemo> {
  double _turns = .0;
  int _tn = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('自定义旋转动画的Box'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TurnBox(
                turns: _turns,
                speed: 500,
                child: Icon(
                  Icons.refresh,
                  size: 50,
                ),
              ),
              TurnBox(
                turns: _turns,
                speed: 1500,
                child: Icon(
                  Icons.refresh,
                  size: 150.0,
                ),
              ),
              // 和自定义的TurnBox比较没有过渡动画，只能顺时针旋转
              RotatedBox(
                quarterTurns: _tn, // 顺时针1/4圈的比例旋转
                child: Icon(
                  Icons.refresh,
                  size: 100.0,
                ),
              ),
              RaisedButton(
                child: Text("顺时针旋转1/4圈"),
                onPressed: () {
                  setState(() {
                    _turns += .25;
                  });
                },
              ),
              RaisedButton(
                child: Text("逆时针旋转1/4圈"),
                onPressed: () {
                  setState(() {
                    _turns -= .25;
                  });
                },
              ),
              RaisedButton(
                child: Text('顺时针旋转1/4圈'),
                onPressed: () {
                  setState(() {
                    _tn += 1; // 1个1/4圈
                  });
                },
              )
            ],
          ),
        ));
  }
}
