import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  // 计数器
  void _add() {
    setState(() {
      _counter++;
    });
  }

  @override
  bool get wantKeepAlive => true; // 返回true，可以记忆状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '车辆总计：',
              style: Theme.of(context).textTheme.display2,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display3,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: '点击+1',
        child: Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
