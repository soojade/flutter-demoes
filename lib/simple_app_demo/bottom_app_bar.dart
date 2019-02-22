import 'package:flutter/material.dart';

class MyBottomAppBar extends StatefulWidget {
  _MyBottomAppBarState createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.lightBlueAccent,
      shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.home),
              highlightColor: Colors.lime,
              tooltip: '首页',
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart),
              highlightColor: Colors.lime,
              tooltip: '购物车',
              onPressed: () {}),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //均分底部导航栏横向空间
      ),
    );
  }
}
