import 'dart:math';
import 'package:flutter/material.dart';
import 'circle_progress_bar.dart';
import '../turn_box/turn_box.dart';

class CircleProgressBarDemo extends StatefulWidget {
  @override
  _CircleProgressBarDemoState createState() => _CircleProgressBarDemoState();
}

class _CircleProgressBarDemoState extends State<CircleProgressBarDemo>
    with TickerProviderStateMixin {
  AnimationController _controller; // 动画控制器

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    bool isForward = true; // 是否在执行状态

    _controller.addStatusListener((status) {
      switch (status) {
        case AnimationStatus.forward:
          isForward = true;
          break;
        case AnimationStatus.reverse:
          isForward = false;
          break;
        default:
          isForward ? _controller.reverse() : _controller.forward();
      }
    });
    _controller.forward(); // 执行动画
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('自定义圆形进度条动画'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AnimatedBuilder(
                  animation: _controller,
                  builder: (BuildContext context, Widget child) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Column(
                          children: <Widget>[
                            Wrap(
                              spacing: 10.0,
                              runSpacing: 15.0,
                              children: <Widget>[
                                CircleProgressBar(
                                  colors: [Colors.green, Colors.green],
                                  radius: 50.0,
                                  stokeWidth: 3.0,
                                  value: _controller.value,
                                ),
                                CircleProgressBar(
                                  colors: [
                                    Colors.green,
                                    Colors.lightGreenAccent,
                                    Colors.yellowAccent
                                  ],
                                  radius: 50.0,
                                  stokeWidth: 3.0,
                                  value: _controller.value,
                                ),
                                CircleProgressBar(
                                  colors: [
                                    Colors.teal,
                                    Colors.pink,
                                    Colors.purple
                                  ],
                                  radius: 50.0,
                                  stokeWidth: 5.0,
                                  strokeCapRound: false,
                                  value: CurvedAnimation(
                                          parent: _controller,
                                          curve: Curves.decelerate)
                                      .value,
                                ),
                                CircleProgressBar(
                                  colors: [
                                    Colors.yellow[100],
                                    Colors.orangeAccent,
                                    Colors.redAccent
                                  ],
                                  radius: 30.0,
                                  stokeWidth: 5.0,
                                  value: CurvedAnimation(
                                          parent: _controller,
                                          curve: Curves.bounceInOut)
                                      .value,
                                ),
                                TurnBox(
                                  turns: .25,
                                  child: CircleProgressBar(
                                    colors: [
                                      Colors.red,
                                      Colors.orange,
                                      Colors.yellow
                                    ],
                                    radius: 30.0,
                                    stokeWidth: 3.0,
                                    totalAngle: 1.5 * pi,
                                    value: CurvedAnimation(
                                            parent: _controller,
                                            curve: Curves.ease)
                                        .value,
                                  ),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: CircleProgressBar(
                                      colors: [
                                        Colors.blue[700],
                                        Colors.lightGreen[200]
                                      ],
                                      radius: 50.0,
                                      stokeWidth: 3.0,
                                      backgroundColor: Colors.transparent,
                                      value: _controller.value),
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: CircleProgressBar(
                                      colors: [
                                        Colors.teal[700],
                                        Colors.lightGreen[200]
                                      ],
                                      radius: 50.0,
                                      stokeWidth: 3.0,
                                      value: _controller.value),
                                ),
                                CircleProgressBar(
                                  colors: [
                                    Colors.red,
                                    Colors.amber,
                                    Colors.cyan,
                                    Colors.green[200],
                                    Colors.blue,
                                    Colors.red
                                  ],
                                  radius: 50.0,
                                  stokeWidth: 5.0,
                                  value: _controller.value,
                                ),
                              ],
                            ),
                            CircleProgressBar(
                              colors: [Colors.blue[300], Colors.green],
                              radius: 50.0,
                              stokeWidth: 10.0,
                              value: _controller.value,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: CircleProgressBar(
                                colors: [Colors.blue[700], Colors.green[300]],
                                radius: 50.0,
                                stokeWidth: 10.0,
                                value: _controller.value,
                                strokeCapRound: false,
                              ),
                            ),
                            //剪裁半圆
                            ClipRect(
                              child: Align(
                                alignment: Alignment.topCenter,
                                heightFactor: .5,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: SizedBox(
                                    //width: 100.0,
                                    child: TurnBox(
                                      turns: .75,
                                      child: CircleProgressBar(
                                        colors: [Colors.teal, Colors.cyan[500]],
                                        radius: 50.0,
                                        stokeWidth: 8.0,
                                        value: _controller.value,
                                        totalAngle: pi,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 104.0,
                              width: 200.0,
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Positioned(
                                    height: 200.0,
                                    top: .0,
                                    child: TurnBox(
                                      turns: .75,
                                      child: CircleProgressBar(
                                        colors: [Colors.teal, Colors.cyan[500]],
                                        radius: 100.0,
                                        stokeWidth: 8.0,
                                        value: _controller.value,
                                        totalAngle: pi,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "${(_controller.value * 100).toInt()}%",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                )
              ],
            ),
          ),
        ));
  }
}
