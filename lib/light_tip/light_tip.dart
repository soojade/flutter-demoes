import 'package:flutter/material.dart';

class LightTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('轻量级的小提示'),
      ),
      body: Center(
        child: Tooltip(
          message: '这是一个小提示，长按就可以看到我了',
          child: Icon(Icons.all_inclusive),
        ),
      ),
    );
  }
}
