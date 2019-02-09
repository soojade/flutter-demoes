import 'package:flutter/material.dart';
import 'package:flutter_demoes/custom_route_animation/custom_route.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一页'),
//        elevation: 4.0, // 与下面的间隔，不设置默认4，设置为0 会重合在一起
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Icon(
              Icons.navigate_next,
              color: Colors.yellow,
              size: 65.0,
            ),
            onPressed: () {
              Navigator.of(context).push(CustomRoute(Page2()));
            },
          ),
          alignment: Alignment.bottomRight,
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('第二页'),
        elevation: 2.0,
      ),
      backgroundColor: Colors.lightGreen,
      body: Center(
        child: Container(
          child: MaterialButton(
            child: Icon(
              Icons.navigate_before,
              color: Colors.yellow,
              size: 60.0,
            ),
            onPressed: () {
              Navigator.of(context).pop(context);
            },
          ),
          alignment: Alignment.bottomRight,
        ),
      ),
    );
  }
}
