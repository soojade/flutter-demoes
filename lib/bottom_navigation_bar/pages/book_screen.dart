import 'package:flutter/material.dart';

class BookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('书籍'),
      ),
      body: Center(
        child: Text('这里是书籍页'),
      ),
    );
  }
}
