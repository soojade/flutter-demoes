import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Text(
          '闪屏动画效果展示',
          style: ThemeData().textTheme.display2,
        ),
      ),
    );
  }
}
