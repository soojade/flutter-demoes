import 'package:flutter/material.dart';

import './pages/book_screen.dart';
import './pages/home_screen.dart';
import './pages/photo_screen.dart';
import './pages/shopping_cart_screen.dart';

class BottomNavigation extends StatefulWidget {
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _bottomNavigationColor = Colors.lightBlue; // 设置导航显示颜色
  int _currentIndex = 0;
  List<Widget> list = []; // 存放导航的页面

  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(BookScreen())
      ..add(PhotoScreen())
      ..add(ShoppingCartScreen()); // 建造者模式，将页面添加到列表
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex], // 根据索引显示当前页面
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: _bottomNavigationColor),
                title: Text('首页',
                    style: TextStyle(color: _bottomNavigationColor))),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.book,
                  color: _bottomNavigationColor,
                ),
                title: Text(
                  '书籍',
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
          ],
          onTap: (int index) {
            setState(() => _currentIndex = index); // 根据点击实时设置当前索引
          },
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed),
    );
  }
}
