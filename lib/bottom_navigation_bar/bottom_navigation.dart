import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _bottomNavigationColor = Colors.lightBlue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _bottomNavigationColor),
            title: Text('首页', style: TextStyle(color: _bottomNavigationColor))),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.backup,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '网盘',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.photo,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '图片',
              style: TextStyle(color: _bottomNavigationColor),
            )),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
              color: _bottomNavigationColor,
            ),
            title: Text(
              '购物车',
              style: TextStyle(color: _bottomNavigationColor),
            ))
      ], type: BottomNavigationBarType.fixed),
    );
  }
}
