import 'package:flutter/material.dart';
import 'home_page.dart';

class KeepAliveTab extends StatefulWidget {
  @override
  _KeepAliveTabState createState() => _KeepAliveTabState();
}

class _KeepAliveTabState extends State<KeepAliveTab>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  // 重写初始化方法
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  // 重写释放方法 只释放TabController
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('保持状态的tab'),
        bottom: TabBar(
          indicatorColor: Colors.greenAccent, // 设置选中后下面指示条的颜色
          controller: _controller,
          tabs: <Widget>[
            Tab(
                icon: Icon(
              Icons.directions_bike,
              color: Colors.white,
            )),
            Tab(icon: Icon(Icons.directions_car, color: Colors.white)),
            Tab(icon: Icon(Icons.directions_bus, color: Colors.white)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          MyHomePage(),
          MyHomePage(),
          MyHomePage(),
        ],
      ),
    );
  }
}
