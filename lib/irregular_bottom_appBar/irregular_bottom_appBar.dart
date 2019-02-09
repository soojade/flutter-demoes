import 'package:flutter/material.dart';

import './each_view.dart';

class IrregularBottomAppBar extends StatefulWidget {
  @override
  _IrregularBottomAppBarState createState() => _IrregularBottomAppBarState();
}

class _IrregularBottomAppBarState extends State<IrregularBottomAppBar> {
  List<Widget> _viewList = [];
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _viewList..add(EachView('首页'))..add(EachView('购物车'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _viewList[_index], // 动态显示页面
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => EachView('新建页面')));
        },
        tooltip: '添加',
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // 浮动按钮的定位
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
